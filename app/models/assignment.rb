class Assignment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :writer
end
