ActiveAdmin.register Skin do
  

  menu parent: 'Головна сторінка', label: "Кейси", priority: 1, html_options: {class: 'ico_0'}
  permit_params :name, :index, :show, :category_id, :client, :brand, :video, :picture, :picture_cache, {award_ids: []}, :team_id, 
                translations_attributes: [:locale, :id, :name, :client, :brand, :video]
  actions :all, :except => [:show]
  links :all

  index title: "Кейси", link_title: "Добавити кейс" do
    selectable_column
    id_column
    column :name
    column :category
    column :client
    column :brand
    column :video 
    column :index
    column :show
    column :created_at
    actions
  end

  form link_title: "Повернутися до кейсів" do |f|
    f.inputs class: "left label_none enother_language" do
      f.translate_inputs do |t|
        t.input :name
        t.input :client
        t.input :brand
        t.input :video
      end
    end

    f.inputs class: "right label_none" do
      f.input :category
      f.input :picture, :as => :picture, label: "Головне зображення"
      f.input :index
      f.input :show          
    end

    f.inputs class: "left label_none" do
      f.input :team, as: :select, collection: Team.all.map{|t| [t.director+": "+t.operator,t.id]}
      f.input :awards, as: :check_boxes
    end

    
    f.actions do
      f.next_language
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end
  end

end
