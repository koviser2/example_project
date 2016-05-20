require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  setup do
    @client = Client.create()
    @locals = I18n.available_locales
  end

  test "should be valid" do
    assert @client.valid?
  end

  test "should not have errors" do
    assert_equal [], @client.errors.full_messages
  end

  test "translate describe" do
    @locals.each do |locale|
      I18n.locale = locale
      assert @client.translation.update_attributes(name: "#{locale}_name")
    end
    assert_equal @locals.size, @client.translations.size
  end

  test "show method" do
  	assert Client.show.to_a.is_a?(Array)
  end

  test "accept nested_attributes" do
    test_atributes = [:translations]
    has_atributes  = @client.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end

  test "uploader model" do
    assert @client.picture.is_a?(AwardUploader)
  end
end
