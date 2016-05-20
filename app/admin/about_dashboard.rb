ActiveAdmin.register AboutDashboard do  

  menu parent: 'Про людей', label: "Головна", priority: 2, html_options: {class: 'ico_0'}
  actions :all, :except => [:show]
  permit_params :describe, :adress, :enquiries, :bidding, :facebook, :vimeo,
  translations_attributes: [:locale, :id, :describe, :adress]  
  level1
  links :all
  
  form level1: true do |f|    
    f.inputs class: "left label_none enother_language" do
      f.translate_inputs do |t|
        t.input :describe, :as => :ckeditor, :input_html => { ckeditor: { :height => 250 } }
        t.input :adress, :as => :ckeditor, :input_html => { ckeditor: { :height => 150 } }
      end
    end

    f.inputs class: "right label_none" do    
      f.input :enquiries
      f.input :bidding
      f.input :facebook
      f.input :vimeo
    end 

    f.actions do
      f.next_language
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end
  end

end