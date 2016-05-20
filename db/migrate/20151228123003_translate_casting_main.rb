class TranslateCastingMain < ActiveRecord::Migration
  def self.up
    CastingDashboard.create_translation_table!({
      describe: :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    CastingDashboard.drop_translation_table! migrate_data: false
  end
end
