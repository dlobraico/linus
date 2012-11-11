class Role < ActiveRecord::Base
  has_and_belongs_to_many :editors, :join_table => :editors_roles
  belongs_to :resource, :polymorphic => true
end
