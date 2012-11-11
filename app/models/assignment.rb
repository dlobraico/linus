class Assignment < ActiveRecord::Base
  resourcify
  belongs_to :idea
  has_many :submissions
  belongs_to :issue
  belongs_to :writer
  attr_accessible :issue_id, :idea_id, :writer_id
end
