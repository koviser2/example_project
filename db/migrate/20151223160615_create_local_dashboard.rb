class CreateLocalDashboard < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      text = %Q(Ukraine is big and diverse. It has mountains, seas, steppes, forests, rivers, authentic villages, old royal palaces, Soviet time paraphernalia and locations and modern cities. Some locations are peculiar only to our country. Some others have European or Eastern look. The Dnipro is considered to be one of the cleanest rivers in Europe. The Carpathian mountains get a lot of snow in winter. The Black sea is warm in summer and has both pebble and sand shores. Ukrainian villages are impressive examples of national history and culture. Historical architectural structures are being restored and preserved. There are a lot of Byzantine and Ukrainian Baroque churches and cathedrals. Modern steal-and-glass constructions are springing up like mushrooms in the big cities.)
      LocationDashboard.create({describe: text})
    end
  end
  
  def change
    create_table :location_dashboards do |t|
      t.text :describe     
      t.timestamps null: false
    end
  end
end
