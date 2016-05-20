require 'test_helper'

class AwardTest < ActiveSupport::TestCase
  setup do
    @award  = Award.create()
  end

  test "should be valid" do
    assert @award.valid?
  end

  test "should not have errors" do
    assert_equal [], @award.errors.full_messages
  end

  test "uploader model" do
    assert @award.picture.is_a?(AwardUploader)
  end
end
