require 'test_helper'
class AboutTest < ActiveSupport::TestCase

  setup do
    @about  = About.create()
    @locals = I18n.available_locales
  end

  test "should be valid" do
    assert @about.valid?
  end

  test "should not have errors" do
    assert_equal [], @about.errors.full_messages
  end

  test "translate atributes" do
  	attributes = [:first_name, :last_name, :position, :describe, :picture_name]
    @locals.each do |locale|
      I18n.locale = locale
      hash = attributes.inject({}){|hash, value| hash.merge(value => "#{locale}_#{value}")}
      assert @about.translation.update_attributes(hash)
    end
    assert_equal @locals.size, @about.translations.size

    arrays_save_attributes = @about.translations.map do |about|
      about.attributes.select{|key, value| key.to_sym.in? attributes}.values.compact
    end

    assert_equal attributes.size*@locals.size, arrays_save_attributes.flatten.uniq.size
  end

  test "accept nested_attributes" do
    test_atributes = [:translations]
    has_atributes  = @about.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end

  test "uploader model" do
    assert @about.picture.is_a?(AboutUploader)
  end
end
