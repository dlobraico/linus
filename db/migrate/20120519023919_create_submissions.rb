class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :headline
      t.string :byline
      t.text :body

      t.timestamps
    end
  end
end
