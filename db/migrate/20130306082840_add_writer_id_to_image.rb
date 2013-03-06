class AddWriterIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :writer_id, :integer
  end
end
