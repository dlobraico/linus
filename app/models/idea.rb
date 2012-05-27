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
  has_many :assignments
  has_many :writers, :through => :assignments
  attr_accessible :headline
  accepts_nested_attributes_for :writers
  
  def assign!(writer)
    unless writer.is_a? Writer
      w = Writer.find_or_create_by_email(writer[:email], :name => writer[:name])
      writer = w
    end
    self.writers << writer
    self.save
  end
end
