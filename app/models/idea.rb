# == Schema Information
#
# Table name: ideas
#
#  id         :integer         not null, primary key
#  headline   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Idea < ActiveRecord::Base
  attr_accessible :headline
  #attr_accessible :created_at, :id, :updated_at
end
