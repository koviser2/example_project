module ActiveAdmin

  module Views  
    
    class Header < Component

      def build(namespace, menu)
        super(id: "header")

        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        build_click_title
        insert_tag Arbre::HTML::Div, class: 'in_header' do
          build_global_navigation          
          # build_utility_navigation
        end
        build_site_title
      end


      def build_click_title
        insert_tag Arbre::HTML::Div, class: 'click_title' do
          text_node helpers.content_tag(:div,'', class: 'my_ico')
        end
      end

    end#Header

    class DropdownMenu < ActiveAdmin::Component
      def build_menu(options)
        options[:class] ||= ''
        options[:class] << ' dropdown_menu_list'
        menu_list       = nil

        div :class => 'my_dropdown_menu_list_wrapper' do
          menu_list = ul(options)
        end

        menu_list
      end

    end#DropdownMenu      

  end #Views   
end

