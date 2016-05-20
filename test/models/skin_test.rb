require 'test_helper'

class SkinTest < ActiveSupport::TestCase
  setup do
    @skin   = Skin.create()
    @locals = I18n.available_locales
  end

  test "should be valid" do
    assert @skin.valid?
  end

  test "should not have errors" do
    assert_equal [], @skin.errors.full_messages
  end

  test "translate atributes" do
  	attributes = [:name, :client, :brand, :video]
    @locals.each do |locale|
      I18n.locale = locale
      hash = attributes.inject({}){|hash, value| hash.merge(value => "#{locale}_#{value}")}
      assert @skin.translation.update_attributes(hash)
    end
    assert_equal @locals.size, @skin.translations.size

    arrays_save_attributes = @skin.translations.map do |skin|
      skin.attributes.select{|key, value| key.to_sym.in? attributes}.values.compact
    end

    assert_equal attributes.size*@locals.size, arrays_save_attributes.flatten.uniq.size
  end

  test "accept nested_attributes" do
    test_atributes = [:translations, :awards]
    has_atributes  = @skin.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end

  test "show method" do
  	assert Skin.show.to_a.is_a?(Array)
  end

  test "uploader model" do
    assert @skin.picture.is_a?(SkinUploader)
  end
end
