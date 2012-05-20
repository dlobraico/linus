class AddEmailToWriter < ActiveRecord::Migration
  def change
    add_column :writers, :email, :string
  end
end
