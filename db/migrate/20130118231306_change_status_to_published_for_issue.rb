class ChangeStatusToPublishedForIssue < ActiveRecord::Migration
  def up
    rename_column :issues, :status, :published
    change_column :issues, :published, :boolean
  end

  def down
    change_column :issues, :published, :string
    rename_column :issues, :published, :status
  end
end
