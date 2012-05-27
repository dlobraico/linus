class Issue < ActiveRecord::Base
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
end
