require 'test_helper'

class LocationDashboardTest < ActiveSupport::TestCase

  setup do
    @location = LocationDashboard.create()
    @locals   = I18n.available_locales
  end

  test "should be valid" do
    assert @location.valid?
  end

  test "should not have errors" do
    assert_equal [], @location.errors.full_messages
  end

  test "translate describe" do
    @locals.each do |locale|
      I18n.locale = locale
      assert @location.translation.update_attributes(describe: "#{locale}_describe")
    end
    assert_equal @locals.size, @location.translations.size
  end

  test "accept nested_attributes" do
    test_atributes = [:translations]
    has_atributes  = @location.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end
end
