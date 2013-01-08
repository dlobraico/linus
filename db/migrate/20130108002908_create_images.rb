class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :description
      t.string :file
      t.references :imageable, :polymorphic => true

      t.timestamps
    end
    add_index :images, :imageable_id
  end
end
