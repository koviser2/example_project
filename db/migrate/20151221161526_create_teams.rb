class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :director
      t.string :operator
      t.timestamps null: false
    end

    create_table :awards do |t|
      t.string :name
      t.string :picture
      t.timestamps null: false
    end

    change_table :skins do |t|
      t.belongs_to :team, index: true
    end

    create_table :award_skins do |t|
      t.belongs_to :award, index: true
      t.belongs_to :skin, index: true
      t.timestamps null: false
    end

  end
end
