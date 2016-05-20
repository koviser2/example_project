class CreateAboutsLocale < ActiveRecord::Migration
  def self.up
    AboutDashboard.create_translation_table!({
      describe: :text,
      adress: :text
    }, {
      migrate_data: true
    })

    About.create_translation_table!({
      first_name: :string,
      last_name: :string,
      position: :string,
      describe: :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    AboutDashboard.drop_translation_table! migrate_data: false
    About.drop_translation_table! migrate_data: false
  end
end
