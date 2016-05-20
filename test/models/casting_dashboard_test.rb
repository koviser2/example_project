require 'test_helper'

class CastingDashboardTest < ActiveSupport::TestCase
  setup do
    @casting = CastingDashboard.create()
    @locals  = I18n.available_locales
  end

  test "should be valid" do
    assert @casting.valid?
  end

  test "should not have errors" do
    assert_equal [], @casting.errors.full_messages
  end

  test "translate describe" do
    @locals.each do |locale|
      I18n.locale = locale
      assert @casting.translation.update_attributes(describe: "#{locale}_describe")
    end
    assert_equal @locals.size, @casting.translations.size
  end

  test "accept nested_attributes" do
    test_atributes = [:translations]
    has_atributes  = @casting.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end
end
