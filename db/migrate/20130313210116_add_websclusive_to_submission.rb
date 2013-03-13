class AddWebsclusiveToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :websclusive, :boolean
  end
end
