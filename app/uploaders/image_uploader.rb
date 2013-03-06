# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :original

  version :primary do
    process :manual_crop
    process :resize_to_fill => [480, 200]
  end

  version :secondary do
    #process :manual_crop
    process :resize_to_fill => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg png gif svg)
  end

  def manual_crop
    if model.crop_x.present?
      resize_to_limit(480, 200)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end
end
