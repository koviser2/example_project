require 'test_helper'

class ClientDashboardTest < ActiveSupport::TestCase
  setup do
    @client = ClientDashboard.create()
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
      assert @client.translation.update_attributes(footer: "#{locale}_footer")
    end
    assert_equal @locals.size, @client.translations.size
  end

  test "string object" do
    assert_equal "Clients", @client.to_s
  end

  test "accept nested_attributes" do
    test_atributes = [:translations, :clients]
    has_atributes  = @client.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end
end
