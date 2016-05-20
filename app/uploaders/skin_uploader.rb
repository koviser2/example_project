# encoding: utf-8
class SkinUploader < CarrierWave::Uploader::Base
  include Modules::Uploader
  include CarrierWave::MiniMagick

  storage :file

  process :convert => 'jpg', :if => :png?
  process :strip
  process :quality => 99
  process :read_dimensions_picture

  def png?(file)
    file.extension != 'png'
  end
end