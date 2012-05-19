class Editor < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username
end
