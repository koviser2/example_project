module ActiveAdmin
 module Inputs
    class PictureInput < ::Formtastic::Inputs::FileInput
      def to_html
        input_wrapping do
          label_html <<
          template.content_tag(:div, class: 'picture') do
            builder.file_field(method, input_html_options) <<
            generate_phone <<
            generate_picture
          end #template.content_tag  picture       
        end #input_wrapping
      end #to_html

      private
        def generate_picture
          present = object.send(input_name).present?

          template.content_tag(:div,'',class: present ? 'image_phone' : 'image_phone no_picture') do
            if present
              template.image_tag object.send(input_name).url 
            else
              template.image_tag nil
            end   
          end  #template.content_tag  image_phone         
        end

        def generate_phone
          template.content_tag(:div, class: 'phone') do
              template.content_tag(:div,'',class: 'image_tree') <<
              template.content_tag(:p) do
                I18n.t('active_admin.koviser.select_picture').html_safe
              end #template.content_tag(:p)
            end #template.content_tag phone
        end
    end #PictureInput

    class RadioInput  < ::Formtastic::Inputs::RadioInput
      def choice_html(choice)   
        builder.radio_button(input_name, choice_value(choice), input_html_options.merge(choice_html_options(choice)).merge(:required => false)) <<
        template.content_tag(:label,
          choice_label(choice),
          label_html_options.merge(:for => choice_input_dom_id(choice), :class => nil)
        )
      end
    end #RadioInput

    class CheckBoxesInput < ::Formtastic::Inputs::CheckBoxesInput
      def choice_html(choice)
        checkbox_input(choice)  <<
        template.content_tag(
          :label,
          choice_label(choice),
          label_html_options.merge(:for => choice_input_dom_id(choice), :class => nil)
        )
      end
    end#CheckBoxesInput

    class BooleanInput  < ::Formtastic::Inputs::BooleanInput
      def label_with_nested_checkbox
        check_box_html <<
        builder.label(
          method,
          label_text,
          label_html_options
        )
      end
    end #BooleanInput
  end #Inputs
end