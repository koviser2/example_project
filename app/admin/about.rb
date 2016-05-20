ActiveAdmin.register About do  

  menu parent: 'Про людей', label: "Персонал", priority: 1, html_options: {class: 'ico_0'}
  actions :all, :except => [:show]
  permit_params :picture, :picture_cache, :first_name, :last_name, :email, :describe, :position, :index, :show, :picture_name, :picture_name_cache,
                translations_attributes: [:locale, :id, :first_name, :last_name, :position, :describe, :picture_name, :picture_name_cache]
  links :all

  index title: "Персонал", link_title: "Добавити персону" do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :position
    column :index
    column :show
    column :created_at
    actions
  end

  form link_title: "Повернутися до персоналу" do |f|   
    f.inputs class: "left label_none enother_language" do
      f.translate_inputs do |t|
        t.input :first_name
        t.input :last_name
        t.input :picture_name, as: :picture
        t.input :describe
        t.input :position
      end
    end

    f.inputs class: "right label_none" do
      f.input :email
      f.input :picture, as: :picture
      f.input :index
      f.input :show
    end
      
    f.actions do
      f.next_language
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end 

  end
end
