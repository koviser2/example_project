class CreateLocaleLocationDashboard < ActiveRecord::Migration
 def self.up
    LocationDashboard.create_translation_table!({
      describe: :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    LocationDashboard.drop_translation_table! migrate_data: false
  end
end
