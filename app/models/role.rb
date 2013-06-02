class Role < ActiveRecord::Base
  resourcify
  has_and_belongs_to_many :editors, :join_table => :editors_roles
  belongs_to :resource, :polymorphic => true

  def display_name 
      name.to_s.titleize
  end
end
