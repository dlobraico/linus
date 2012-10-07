# == Schema Information
#
# Table name: writers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string(255)
#  name       :string(255)
#

class Writer < ActiveRecord::Base
  has_many :assignments
  has_many :submissions
  has_many :ideas, :through => :assignments, :dependent => :nullify
  attr_accessible :name, :email

  validates_uniqueness_of :email
end
