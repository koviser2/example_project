module ActiveAdmin
  class FormBuilder < ::Formtastic::FormBuilder    

    def next_language(html_options = {}, li_attrs = {})
      li_attrs[:class] ||= 'next_language'
      li_content         = template.content_tag(:div, I18n.t('active_admin.koviser.next_language'), html_options)
      template.content_tag(:li, li_content, li_attrs)
    end
    private   

    # Capture the ADD JS
    def js_for_has_many(assoc, form_block, template, new_record, class_string)
      class_string << ' has_many_fields_new'
      assoc_reflection = object.class.reflect_on_association assoc
      assoc_name       = assoc_reflection.klass.model_name
      placeholder      = "NEW_#{assoc_name.to_s.underscore.upcase.gsub(/\//, '_')}_RECORD"

      opts = {
        for: [assoc, assoc_reflection.klass.new],
        class: class_string,
        for_options: { child_index: placeholder }
      }

      html = template.capture{ inputs_for_nested_attributes opts, &form_block }
      text = new_record.is_a?(String) ? new_record : I18n.t('active_admin.has_many_new', model: assoc_name.human)

      template.link_to  '#', class: 'button has_many_add', data: {html: CGI.escapeHTML(html).html_safe, placeholder: placeholder} do
        template.content_tag :span, text
      end      
    end

  end
end