require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  setup do
    @team   = Team.create()
    @locals = I18n.available_locales
  end

  test "should be valid" do
    assert @team.valid?
  end

  test "should not have errors" do
    assert_equal [], @team.errors.full_messages
  end

  test "translate atributes" do
    attributes = [:director, :operator]
    @locals.each do |locale|
      I18n.locale = locale
      hash = attributes.inject({}){|hash, value| hash.merge(value => "#{locale}_#{value}")}
      assert @team.translation.update_attributes(hash)
    end
    assert_equal @locals.size, @team.translations.size

    arrays_save_attributes = @team.translations.map do |team|
      team.attributes.select{|key, value| key.to_sym.in? attributes}.values.compact
    end

    assert_equal attributes.size*@locals.size, arrays_save_attributes.flatten.uniq.size
  end

  test "accept nested_attributes" do
    test_atributes = [:translations]
    has_atributes  = @team.nested_attributes_options.keys
    assert test_atributes.sort == has_atributes.sort
  end
end
