class CreateAssignment < ActiveRecord::Migration
  def up
    create_table :assignments do |t|
      t.integer :idea_id
      t.integer :writer_id

      t.timestamps
    end
  end

  def down
    drop_table :assignments
  end
end
