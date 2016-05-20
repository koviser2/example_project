require 'test_helper'

class UserChangeTest < ActiveSupport::TestCase
  setup do
  	@tableedit = Skin.create
    @change   = UserChange.create(admin_user: admin_users(:one), tableedit: @tableedit)
    @locals   = I18n.available_locales
  end

  test "should be valid" do
    assert @change.valid?
  end

  test "should not have errors" do
    assert_equal [], @change.errors.full_messages
  end

  test "only 10 changes" do
  	20.times do 
  		UserChange.create(admin_user: admin_users(:one), tableedit: @tableedit)
  	end
  	assert_equal 10, UserChange.where(tableedit: @tableedit).count
  end
end
