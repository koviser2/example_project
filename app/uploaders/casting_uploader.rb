# encoding: utf-8
class CastingUploader < CarrierWave::Uploader::Base
  include Modules::Uploader
  include CarrierWave::MiniMagick

  storage :file

  # process :convert => 'jpg', :if => :png?
  process :strip
  process :quality => 99
  # process :read_dimensions_picture

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  def png?(file)
    file.extension != 'png'
  end
end