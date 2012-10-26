class AddNotesToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :notes, :text
  end
end
