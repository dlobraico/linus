class AddSubmissionDeadlineToIssue < ActiveRecord::Migration
  def up
    add_column :issues, :submission_deadline, :datetime
    Issue.all.each do |i|
      i.submission_deadline = i.printing_deadline
      i.save
    end
  end
  
  def down
    remove_column :issues, :submission_deadline
  end
end
