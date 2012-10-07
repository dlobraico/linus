# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  headline   :string(255)
#  byline     :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  issue_id   :integer
#  writer_id  :string(255)
#

class Submission < ActiveRecord::Base
  resourcify
  attr_accessible :body, :byline, :headline, :writer_id
  belongs_to :issue
  belongs_to :writer

  before_validation :sanitize_body, :on => :create
  before_validation :sanitize_body, :on => :update

  private
  def sanitize_body
    self.body = sanitize self.body
  end

  def sanitize field
    result =
      ActionController::Base.helpers.sanitize(field,
        :tags => %w(a b i strong em p h1 h2 h3 h4 h5 h6),
        :attributes => %w(href name src type value width height data))
    result.gsub(/&nbsp;/, ' ')
  end
end
