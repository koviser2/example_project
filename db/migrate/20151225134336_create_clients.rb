class CreateClients < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      footer = %Q(Our doors are widely open for new clients and partners.<br>
        We are here to meet you and make your production comfortable and simply right.) 
      ClientDashboard.create({footer: footer})
    end
  end
  
  def change
    create_table :client_dashboards do |t|
      t.text :footer
      t.timestamps null: false
    end

    create_table :clients do |t|
      t.belongs_to :client_dashboard, index: true
      t.string :picture
      t.string :name
      t.integer :index, default: 0
      t.boolean :show, default: true
      t.timestamps null: false
    end
  end
end
