class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  attr_accessible :description, :file
  mount_uploader :file, AttachmentUploader
end
