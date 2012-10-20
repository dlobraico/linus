class ChangeSubmissionWriterIdToInt < ActiveRecord::Migration
  def up
    change_column :submissions, :writer_id, :integer
  end

  def down
    change_column :submissions, :writer_id, :string
  end
end
