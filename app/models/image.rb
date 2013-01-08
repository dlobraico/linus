class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  attr_accessible :description, :file
  mount_uploader :file, ImageUploader
end
