# == Schema Information
#
# Table name: writers
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Writer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email

  def name
    "#{first_name} #{last_name}"
  end
end
