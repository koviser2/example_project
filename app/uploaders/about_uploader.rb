# encoding: utf-8
class AboutUploader < CarrierWave::Uploader::Base
  include Modules::Uploader
  include CarrierWave::MiniMagick

  storage :file

  # process :convert => 'jpg', :if => :png?
  process :strip
  process :quality => 99
  # process :read_dimensions_picture

  version :little do
    process :resize_to_fill => [551, 828]
  end

  def png?(file)
    file.extension != 'png'
  end
end