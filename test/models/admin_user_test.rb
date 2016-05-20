require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
 
  test "free parameters" do
    user = AdminUser.new
    assert_not user.save
  end

  test "no password" do
    user = AdminUser.new(email: "test@test.com")
    assert_not user.save
  end

  test "confirmation password" do
    user = AdminUser.new(email: "test@test.com", password: "123456789", password_confirmation: "33333333333")
    assert_not user.save
  end

  test "csave user" do
    user = AdminUser.new(email: "test@test.com", password: "123456789", password_confirmation: "123456789")
    assert user.save
  end

end
