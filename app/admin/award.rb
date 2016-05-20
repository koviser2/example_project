ActiveAdmin.register Award do
  

  menu parent: 'Головна сторінка', label: "Нагороди", priority: 4, html_options: {class: 'ico_0'}
  permit_params :name, :picture, :picture_cache
  actions :all, :except => [:show]
  links :all

  index title: "Нагороди", link_title: "Добавити нагороду" do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  form link_title: "Повернутися до команд" do |f|
    f.inputs class: "left" do
      f.input :name
      f.input :picture, as: :picture
      f.actions do
        f.next_language
        f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
        f.cancel_link
      end
    end    
  end

end
