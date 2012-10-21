class AddCleanBodyToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :clean_body, :text
  end
end
