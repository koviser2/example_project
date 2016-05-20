ActiveAdmin.register UserChange do
  
  menu label: "Реєстрація змін", priority: 7, html_options: {class: 'ico_1'}
  permit_params :admin_user, :tableedit
  actions :all, :except => [:show, :destroy]
  links :all

  index title: "Зміни", link_title: "Добавити зміну" do
    id_column
    column :admin_user
    column :tableedit
    column :created_at
    actions
  end

  form link_title: "Повернутися назад" do |f|
    f.inputs "Admin Details" do
      f.input :admin_user    
    end

    f.actions do
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end
  end

end
