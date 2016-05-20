class CreateAboutDefault < ActiveRecord::Migration
  def migrate(direction)
    super
    if direction == :up
      text = %Q(The #1 production house in Ukraine, which produces movies , TV-series and advertising content
                <br>
                <span>History</span>
                Pronto Film is a ukrainian production house that was established by Max Asadchiy in 2004 The company is a full-service production of advertisement, music videos  and movies In-house casting studio, location scouting, two editing stations, the storage of props and outfits allow to optimize the production process  Our team is set of professionals from  movie and advertisement production, as well as the ones from prominent advertising agencies
                <span>Mission</span>
                We believe, that we can  bring the best movie maker's experince into advertising practice.
                <span>News</span>
                Все новости можно «копипастить» с нашего сайта здесь: http://www.prontofilm.kiev.ua/portfolio/featuredprojects
              )
      adress = %Q(10A, Naberezhno-Khreschatitska street,
                  <br>
                  office 1 04070 Kiev, Ukraine tel: +380 (44) 490 22 31
                  <br>
                  fax: +380 (44) 490 22 32general
                )
      AboutDashboard.create({describe: text, adress: adress})
    end
  end
  
  def change
    create_table :about_dashboards do |t|
      t.text :describe     
      t.text :adress
      t.string :enquiries
      t.string :bidding
      t.string :facebook
      t.string :vimeo
      t.timestamps null: false
    end

    create_table :abouts do |t|
      t.string :picture
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :describe
      t.string :position
      t.integer :index, default: 0
      t.boolean :show, default: true
      t.timestamps null: false
    end
  end
end
