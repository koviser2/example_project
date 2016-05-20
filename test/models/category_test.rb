require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = Category.create()
    @locals   = I18n.available_locales
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "should not have errors" do
    assert_equal [], @category.errors.full_messages
  end

  test "translate name" do
    @locals.each do |locale|
      I18n.locale = locale
      assert @category.translation.update_attributes(name: "#{locale}_name")
    end
    assert_equal @locals.size, @category.translations.size
  end
  test "accept nested_attributes" do
    test_atributes = [:translations]
    has_atributes  = @category.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end
end
