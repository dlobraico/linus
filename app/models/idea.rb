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
  resourcify
  has_many :assignments
  has_many :writers, :through => :assignments, :dependent => :destroy
  belongs_to :issue
  attr_accessible :headline, :issue_id
  accepts_nested_attributes_for :writers
  
  def assign!(writer)
    unless writer.is_a? Writer
      writer = Writer.find_or_create_by_email(writer)
    end

    unless self.writers.include?  writer
      self.writers << writer
    end

    self.save
  end
end
