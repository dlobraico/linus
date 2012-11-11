class Writer < ActiveRecord::Base
  has_many :assignments
  has_many :submissions
  has_many :ideas, :through => :assignments, :dependent => :nullify
  attr_accessible :name, :email

  validates_uniqueness_of :email
end
