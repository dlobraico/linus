# == Schema Information
#
# Table name: editors
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  username   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Editor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :username
end
