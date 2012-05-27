# == Schema Information
#
# Table name: writers
#
#  id         :integer         not null, primary key
#  name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Writer < ActiveRecord::Base
  has_many :assignments 
  has_many :ideas, :through => :assignments
  attr_accessible :name, :email
end
