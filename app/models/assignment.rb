class Assignment < ActiveRecord::Base
  resourcify
  belongs_to :idea
  belongs_to :writer
  belongs_to :issue
  attr_accessible :issue_id, :idea_id, :writer_id
end
