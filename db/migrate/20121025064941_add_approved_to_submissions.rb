class AddApprovedToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :approved, :boolean
  end
end
