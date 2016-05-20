ActiveAdmin.register Category do
  
  menu parent: 'Головна сторінка', label: "Категорії", priority: 2, html_options: {class: 'ico_0'}
  permit_params :name, :index, :show,
                translations_attributes: [:locale, :id, :name]
  actions :all, :except => [:show]
  links :all

  index title: "Категорії", link_title: "Добавити категорію" do
    selectable_column
    id_column
    column :name
    column :index
    column :show
    column :created_at
    actions
  end

  form link_title: "Повернутися до категорій" do |f|
    f.inputs class: "left label_none enother_language" do
      f.translate_inputs do |t|
        t.input :name
      end
    end
    f.inputs class: :right do
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
