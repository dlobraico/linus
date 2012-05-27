class AddIssueIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :issue_id, :integer
  end
end
