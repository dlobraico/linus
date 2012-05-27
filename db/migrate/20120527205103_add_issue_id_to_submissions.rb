class AddIssueIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :issue_id, :integer
  end
end
