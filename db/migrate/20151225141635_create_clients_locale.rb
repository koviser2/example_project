class CreateClientsLocale < ActiveRecord::Migration
  def self.up
    Client.create_translation_table!({
      name: :string
    }, {
      migrate_data: true
    })

    ClientDashboard.create_translation_table!({
      footer: :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    ClientDashboard.drop_translation_table! migrate_data: false
    Client.drop_translation_table! migrate_data: false
  end
end
