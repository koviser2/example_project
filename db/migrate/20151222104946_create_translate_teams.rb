class CreateTranslateTeams < ActiveRecord::Migration
  def self.up
    Team.create_translation_table!({
      director: :string,
      operator: :string
    }, {
      migrate_data: true
    })
  end

  def self.down
    Team.drop_translation_table! migrate_data: false
  end
end
