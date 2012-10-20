class AddAssignmentIdToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :assignment_id, :integer
  end
end
