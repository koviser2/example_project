# encoding: utf-8
class PicnameUploader < CarrierWave::Uploader::Base
  include Modules::Uploader
  include CarrierWave::MiniMagick

  storage :file

  # process :convert => 'jpg', :if => :png?
  process :strip
  process :quality => 99

  def png?(file)
    file.extension != 'png'
  end
end