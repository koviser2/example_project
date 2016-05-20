require 'test_helper'

class LocationPictureTest < ActiveSupport::TestCase
  setup do
    @location = LocationPicture.create()
    @locals   = I18n.available_locales
  end

  test "should be valid" do
    assert @location.valid?
  end

  test "should not have errors" do
    assert_equal [], @location.errors.full_messages
  end  

  test "show method" do
  	assert Client.show.to_a.is_a?(Array)
  end

  test "uploader model" do
    assert @location.picture.is_a?(DefaultUploader)
  end
end
