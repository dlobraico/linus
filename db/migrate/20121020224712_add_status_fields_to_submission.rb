class AddStatusFieldsToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :copyedited, :boolean
    add_column :submissions, :edited, :boolean
    add_column :submissions, :published, :boolean
  end
end
