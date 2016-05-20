class AddAtributesToAbout < ActiveRecord::Migration
  def self.up
    add_column :abouts, :picture_name, :string
    About.add_translation_fields! picture_name: :string
  end

  def self.down
    remove_column :abouts, :picture_name
    remove_column :about_translations, :picture_name
  end
end