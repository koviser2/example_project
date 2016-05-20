class CreateTranslation < ActiveRecord::Migration
  def self.up
    Category.create_translation_table!({
      name: :string   
    }, {
      migrate_data: true
    })

    Skin.create_translation_table!({
      name: :string,
      client: :string,
      brand: :string,
      video: :string,
    }, {
      migrate_data: true
    })
  end

  def self.down
    Category.drop_translation_table! migrate_data: false
    Skin.drop_translation_table! migrate_data: false
  end
end

