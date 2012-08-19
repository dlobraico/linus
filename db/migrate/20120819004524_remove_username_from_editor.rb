class RemoveUsernameFromEditor < ActiveRecord::Migration
  def change
    remove_column :editors, :username
  end
end
