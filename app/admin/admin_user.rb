ActiveAdmin.register AdminUser do
  
  menu label: "Адміни", priority: 8, html_options: {class: 'ico_6'}
  permit_params :email, :password, :password_confirmation, :role
  actions :all, :except => [:show]
  links :all

  filter :email
  filter :role, as: :select, collection: AdminUser.roles
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  index title: "Адміни", link_title: "Добавити адміна" do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form link_title: "Повернутися до адмінів" do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :role, as: :select, collection: AdminUser.roles.keys
      f.input :password
      f.input :password_confirmation
    end
    f.actions do
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end
  end

end
