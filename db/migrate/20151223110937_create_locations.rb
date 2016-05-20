class CreateLocations < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      names = [
        "CITY",
        "INTERIORS",
        "OFFICES",
        "ROADS",
        "METRO",
        "AIRPORT",
        "OLD EUROPE",
        "MOUNTAINS",
        "NATURE",
        "COAST"
      ]
      names.each_with_index do |name, index|
        Location.create!(name: name, index: index) 
      end
    end
  end

  def change
    create_table :locations do |t|
      t.string :name
      t.integer :index, default: 0
      t.boolean :show, default: true
      t.timestamps null: false
    end

    create_table :location_pictures do |t|
      t.belongs_to :location, index: true      
      t.string :picture
      t.integer :index, default: 0
      t.boolean :show, default: true
      t.timestamps null: false
    end
  end
end