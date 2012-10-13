class AddApprovedToEditor < ActiveRecord::Migration
  def change
    add_column :editors, :approved, :boolean
  end
end
