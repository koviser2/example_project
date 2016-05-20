require 'test_helper'

class CastingTest < ActiveSupport::TestCase
  setup do
    @casting = Casting.create()
  end

  test "should be valid" do
    assert @casting.valid?
  end

  test "should not have errors" do
    assert_equal [], @casting.errors.full_messages
  end

  test "enum people_type" do
  	assert Casting.people_types.is_a?(Hash)
  end

  test "uploader model" do
    assert @casting.picture.is_a?(CastingUploader)
  end
end
