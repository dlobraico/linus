# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    process :resize_to_fit => [800, 800]
  end

  version :primary do
    process :manual_crop
    process :resize_to_fill => [480, 200]
  end

  version :secondary do
    process :resize_to_fill => [200, 200]
  end

  version :original_size do
    process :convert => 'jpg'
    process :get_geometry

    def geometry
      @geometry
    end
  end

  def get_geometry
    if (@file)
      img = ::Magick::Image::read(@file.file).first
      @geometry = [ img.columns, img.rows ]
    end
  end

  def extension_white_list
    %w(jpg jpeg png gif svg)
  end

  # MiniMagick version
  #def manual_crop
  #if model.crop_x.present?
  # resize_to_limit(480, 200)
  #
  # manipulate! do |img|
  #   x = model.crop_x
  #   y = model.crop_y
  #   w = model.crop_w
  #   h = model.crop_h
  #
  #   w << 'x' << h << '+' << x << '+' << y
  #
  #   img.crop(w)
  #   img
  #  end
  # end
  #end

  # RMagick version
  def manual_crop
    if model.crop_x.present?
      manipulate! do |img|
        x = model.crop_x
        y = model.crop_y
        w = model.crop_w
        h = model.crop_h
        img.crop!(x.to_i, y.to_i, w.to_i, h.to_i)
      end
    end
  end
end
