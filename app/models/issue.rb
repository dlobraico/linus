class Issue < ActiveRecord::Base
  resourcify
  has_many :ideas
  has_many :assignments
  has_many :submissions
  has_many :attachments, :as => :attachable

  attr_accessible :distribution, :issue, :printing_deadline, :submission_deadline, :volume, :attachments_attributes, :published_issue, :published
  accepts_nested_attributes_for :attachments

  mount_uploader :published_issue, AttachmentUploader

  def is_next?
    if self == Issue.next_issue
      return true
    else
      return false
    end
  end

  def self.last_issue
    Issue.
      where("id IN (SELECT issue_id FROM submissions WHERE published = ?)", true).
      order("id DESC").
      first
  end

  def self.upcoming_issues
    self.where("distribution > ?", Date.today).order("distribution ASC, created_at ASC")
  end

  def self.next_issue
    self.upcoming_issues.first
  end

  def articles
    submissions.where(:published => true)
  end

  def short_string
    "Vol. #{volume}, Iss. #{issue}"
  end
end
