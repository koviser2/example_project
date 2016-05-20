class CreateTransleteLocation < ActiveRecord::Migration
  def self.up
    Location.create_translation_table!({
      name: :string
    }, {
      migrate_data: true
    })
  end

  def self.down
    Location.drop_translation_table! migrate_data: false
  end
end
