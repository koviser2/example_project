ActiveAdmin.register ClientDashboard do  

  menu label: "Клієнти", priority: 5, html_options: {class: 'ico_4'}
  actions :all, :except => [:show]
  permit_params :footer,
                clients_attributes: [:id, :client_dashboard_id, :picture, :picture_cache, :name,  :index, :show, :_destroy, {translations_attributes: [:locale, :id, :name]}],
                translations_attributes: [:locale, :id, :footer]
  level1
  links :all
  
  form level1: true do |f|  
    f.inputs class: "label_none enother_language" do
      f.translate_inputs do |t|
        t.input :footer, :as => :ckeditor, :input_html => { ckeditor: { :height => 250 } }  
      end
    end 

    f.actions do
      f.next_language
      f.action :submit, button_html: {value: I18n.t("active_admin.koviser.update") }
      f.cancel_link
    end

    f.inputs "Клієнти", class: "line_4 has_many_credentional has_many_credentional_top" do   
      @table = table
      I18n.available_locales.each_with_index do |locale, index|
        @table << th do  
            div "data-locale" => "locale_#{locale}", class: index == 0 ? "active_locale loc_#{locale}" : "loc_#{locale}" do
              I18n.t("active_admin.translate.#{locale.to_s}")
            end
          end
      end    
      f.has_many :clients do |ff|
        I18n.available_locales.each_with_index do |key,index|
          I18n.locale = key
          name = ff.object_name+"[translations_attributes][#{index}]"
          object = ff.object.client_translations.where(locale: key).first 
          my_class = index == 0 ? "locale_#{key} locals active" : "locals locale_#{key}"         
          ff.input :name, input_html: {name: name+"[name]", class: my_class, data: {locale: "loc_#{key}"}}
          ff.input :locale, as: :hidden, input_html: {value: key, name: name+"[locale]", class: my_class}
          ff.input :id_tr, as: :hidden, input_html: {value: object.id, name: name+"[id]", class: my_class} if ff.object.id && object      
        end
        ff.input :picture, as: :picture
        ff.input :index
        ff.input :show
        ff.input :_destroy, :as=>:boolean, :required => false, :label=>I18n.t('active_admin.has_many_remove'), input_html: {class: "my_remove"}  
      end
    end 
  end

end