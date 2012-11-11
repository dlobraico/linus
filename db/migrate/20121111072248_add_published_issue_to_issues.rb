class AddPublishedIssueToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :published_issue, :string
  end
end
