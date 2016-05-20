require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  setup do
    @location = Location.create()
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
      assert @location.translation.update_attributes(name: "#{locale}_name")
    end
    assert_equal @locals.size, @location.translations.size
  end

  test "accept nested_attributes" do
    test_atributes = [:translations, :location_pictures]
    has_atributes  = @location.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end
end
