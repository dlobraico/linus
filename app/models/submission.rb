class StatusValidator < ActiveModel::Validator
  def validate(record)
    if record.published and not (record.copyedited and record.edited)
      record.errors[:base] = "Submissions cannot be published until they have been copyedited and edited."
    end
  end
end

class Submission < ActiveRecord::Base
  has_paper_trail
  include ActiveModel::Validations
  resourcify
  attr_accessible :body, :clean_body, :byline, :headline, :writer_id, :assignment_id, :issue_id, :copyedited, :edited, :published, :approved, :notes, :image_attributes, :websclusive

  belongs_to :assignment
  belongs_to :issue
  belongs_to :writer

  before_validation :sanitize_body, :on => :create
  before_validation :sanitize_body, :on => :update

  validates_with StatusValidator
  validates_presence_of :headline, :byline, :writer_id
  
  has_one :image, :as => :imageable
  accepts_nested_attributes_for :image
  after_initialize do
    self.image ||= self.build_image
  end

  private
  def sanitize_body
    self.body = sanitize self.body
    self.clean_body = sanitize self.clean_body
  end

  def sanitize field
    result =
      ActionController::Base.helpers.sanitize(field,
        :tags => %w(a b i strong em p h1 h2 h3 h4 h5 h6 ul ol li insert delete),
        :attributes => %w(href name src type value width height data class data-cid data-userid data-username data-time))
    result.gsub(/&nbsp;/, ' ')
  end
end
