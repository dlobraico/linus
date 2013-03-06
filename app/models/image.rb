class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  belongs_to :writer
  attr_accessible :description, :file, :remove_file
  mount_uploader :file, ImageUploader
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
end
