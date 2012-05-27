class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :volume
      t.integer :issue
      t.datetime :printing_deadline
      t.datetime :distribution

      t.timestamps
    end
  end
end
