class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :headline

      t.timestamps
    end
  end
end
