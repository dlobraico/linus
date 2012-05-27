class AddIssueIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :issue_id, :integer
  end
end
