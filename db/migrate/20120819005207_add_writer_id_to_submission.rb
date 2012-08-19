class AddWriterIdToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :writer_id, :string
  end
end
