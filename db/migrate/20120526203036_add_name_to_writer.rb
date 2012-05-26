class AddNameToWriter < ActiveRecord::Migration
  def change
    add_column :writers, :name, :string
  end
end
