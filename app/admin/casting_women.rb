ActiveAdmin.register Casting.where(people_type: "women"), as: 'CastingWomen' do
  
  menu parent: 'Кастинг', label: "Жінки", priority: 1, html_options: {class: 'ico_0'}
  permit_params :picture, :picture_cache, :people_type, :index, :show
  actions :all, :except => [:show]
  links :all

  filter :index, label: "Індекс"      
  filter :show, label: "Показати"    
  filter :created_at, label: "Створено" 
  filter :updated_at, label: "Оновлено"

  index title: "Жінки", link_title: "Добавити" do |f|
    selectable_column
    id_column
    column "Фото", :picture do |col|
      link_to edit_resource_path(col) do
        image_tag col.picture.thumb
      end
    end
    column "Індекс", :index
    column "Показати", :show
    column "Створено", :created_at
    actions
  end

  controller do
    def scoped_collection     
      super.where("people_type = ?", 0)
    end 
  end

  form link_title: "Повернутися до списку" do |f|
    f.inputs class: "left label_none" do
      f.input :picture, as: :picture, label: "Фото"
    end
    f.inputs class: "label_none right" do
      f.input :people_type, as: :hidden, input_html: {value: Casting.people_types.keys[0]}
      f.input :index, label: "Індекс"
      f.input :show, label: "Показати"        
    end
    f.actions do
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end
  end

end