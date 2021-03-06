ActiveAdmin.register CastingDashboard do  

  menu parent: "Кастинг", label: "Головна", priority: 5, html_options: {class: 'ico_4'}
  actions :all, :except => [:show]
  permit_params :describe,
                translations_attributes: [:locale, :id, :describe]
  level1
  links :all

  form level1: true do |f|  
    f.inputs class: "label_none enother_language" do
      f.translate_inputs do |t|
        t.input :describe      
      end

      f.actions do
        f.next_language
        f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
        f.cancel_link
      end 
    end 
  end

end