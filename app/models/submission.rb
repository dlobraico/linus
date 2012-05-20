# == Schema Information
#
# Table name: submissions
#
#  id         :integer         not null, primary key
#  headline   :string(255)
#  byline     :string(255)
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Submission < ActiveRecord::Base
  attr_accessible :body, :byline, :headline
end
