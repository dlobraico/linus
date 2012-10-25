# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  headline      :string(255)
#  byline        :string(255)
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  issue_id      :integer
#  writer_id     :integer
#  assignment_id :integer
#  copyedited    :boolean
#  edited        :boolean
#  published     :boolean
#  clean_body    :text

class StatusValidator < ActiveModel::Validator
  def validate(record)
    if record.published and not (record.copyedited and record.edited)
      record.errors[:base] = "Submissions cannot be published until they have been copyedited and edited."
    end
  end
end

class Submission < ActiveRecord::Base
  include ActiveModel::Validations
  resourcify
  attr_accessible :body, :clean_body, :byline, :headline, :writer_id, :assignment_id, :issue_id, :copyedited, :edited, :published, :approved
  belongs_to :assignment
  belongs_to :issue
  belongs_to :writer

  before_validation :sanitize_body, :on => :create
  before_validation :sanitize_body, :on => :update

  validates_with StatusValidator

  private
  def sanitize_body
    self.body = sanitize self.body
    self.clean_body = sanitize self.clean_body
  end

  def sanitize field
    result =
      ActionController::Base.helpers.sanitize(field,
        :tags => %w(a b i strong em p h1 h2 h3 h4 h5 h6 insert delete),
        :attributes => %w(href name src type value width height data class data-cid data-userid data-username data-time))
    result.gsub(/&nbsp;/, ' ')
  end
end
