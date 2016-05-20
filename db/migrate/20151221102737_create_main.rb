class CreateMain < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      names = [
          "Advertising",
          "FILM/ TV-series",
          "Music Videos",
          "Digital",
          "TV design"
      ]
      names.each_with_index do |name, index|
        Category.create!(name: name, index: index, show: true) 
      end
    end
  end

  def change
    create_table :categories do |t|
      t.string :name
      t.integer :index, default: 0
      t.boolean :show
      t.timestamps null: false
    end

    create_table :skins do |t|
      t.string :name
      t.belongs_to :category, index: true
      t.string :client
      t.string :brand
      t.string :video
      t.string :picture
      t.integer :index, default: 0
      t.integer :width, default: 0
      t.integer :height, default: 0
      t.boolean :show
      t.timestamps null: false
    end
  end
end