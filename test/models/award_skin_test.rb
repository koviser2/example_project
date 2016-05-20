require 'test_helper'

class AwardSkinTest < ActiveSupport::TestCase
  setup do
    @award  = AwardSkin.create()
  end

  test "should be valid" do
    assert @award.valid?
  end

  test "should not have errors" do
    assert_equal [], @award.errors.full_messages
  end
end
