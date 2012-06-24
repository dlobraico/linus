class RemoveFirstNameLastNameFromWriter < ActiveRecord::Migration
  def up 
    Writer.all.each {|w| w.name = "#{w.first_name} #{w.last_name}"}
    remove_column :writers, :last_name
    remove_column :writers, :first_name
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted names"
  end
end
