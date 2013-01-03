class Idea < ActiveRecord::Base
  resourcify
  has_many :assignments
  has_many :writers, :through => :assignments, :dependent => :destroy
  belongs_to :issue
  attr_accessible :headline, :issue_id
  accepts_nested_attributes_for :assignments

  def assign!(writer)
    unless writer.is_a? Writer
      writer = Writer.find_or_create_by_email(writer)
    end

    unless self.writers.include?  writer
      self.writers << writer
    end

    self.assignments.each do |a|
      a.issue = Issue.next_issue if a.issue.nil?
    end

    self.save
  end
end
