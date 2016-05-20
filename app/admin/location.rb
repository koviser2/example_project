ActiveAdmin.register Location do
  

  menu parent: 'Місцезнаходження', label: "Розділи", priority: 1, html_options: {class: 'ico_0'}
  actions :all, :except => [:show]
  permit_params :name, :index, :show, 
                location_pictures_attributes: [:id, :location_id, :picture, :picture_cache, :index, :show, :_destroy],
                translations_attributes: [:locale, :id, :name]
  links :all
  
  index title: "Розділи", link_title: "Добавити розділ" do
    selectable_column
    id_column
    column :name
    column :index
    column :show
    column :created_at
    actions
  end

  form link_title: "Повернутися до розділів" do |f|
    f.inputs class: "left label_none enother_language" do
      f.translate_inputs do |t|
        t.input :name
      end
    end

    f.inputs class: "right label_none" do
      f.input :index
      f.input :show
    end
      
    f.actions do
      f.next_language
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end

    f.inputs "Фотографії", class: "line_4 has_many_style" do       
      f.has_many :location_pictures do |ff|
        ff.input :picture, as: :picture
        ff.input :index
        ff.input :show
        ff.input :_destroy, :as=>:boolean, :required => false, :label=>I18n.t('active_admin.has_many_remove'), input_html: {class: "my_remove"}  
      end
    end    
  end

end
