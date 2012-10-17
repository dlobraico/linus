# == Schema Information
#
# Table name: issues
#
#  id                :integer          not null, primary key
#  volume            :integer
#  issue             :integer
#  printing_deadline :datetime
#  distribution      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# TODO: Rename the printing_deadline field to submission_deadline. 
# Or perhaps add an independent submission deadline.
class Issue < ActiveRecord::Base
  resourcify
  has_many :ideas
  has_many :assignments
  has_many :submissions

  attr_accessible :distribution, :issue, :printing_deadline, :volume

  def is_next?
    if self == Issue.next_issue
      return true
    else
      return false
    end
  end

  def self.upcoming_issues
    self.where("distribution > ?", Date.today).order("distribution ASC, created_at ASC")
  end

  def self.next_issue
    self.upcoming_issues.first
  end

  def submission_deadline 
    printing_deadline
  end
end
