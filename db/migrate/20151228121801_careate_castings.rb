class CareateCastings < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      describe = "Describe  information"     
      CastingDashboard.create({describe: describe})
    end
  end
  
  def change
    create_table :casting_dashboards do |t|
      t.text :describe
      t.timestamps null: false
    end

    create_table :castings do |t|
      t.string :picture
      t.integer :people_type, default: 0
      t.integer :index, default: 0
      t.boolean :show, default: true
      t.timestamps null: false
    end
  end
end
