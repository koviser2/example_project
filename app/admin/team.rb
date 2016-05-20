ActiveAdmin.register Team do
  

  menu parent: 'Головна сторінка', label: "Команди", priority: 3, html_options: {class: 'ico_0'}
  permit_params :director, :operator, translations_attributes: [:locale, :id, :director, :operator]
  actions :all, :except => [:show]
  links :all

  index title: "Команди", link_title: "Добавити команду" do
    selectable_column
    id_column
    column :director
    column :operator
    column :created_at
    actions
  end

  form link_title: "Повернутися до команд" do |f|
    f.inputs class: "enother_language" do
      f.translate_inputs do |t|
        t.input :director
        t.input :operator        
      end
    end    
    f.actions do
      f.next_language
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end
  end

end
