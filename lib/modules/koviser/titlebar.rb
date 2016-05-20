module ActiveAdmin
  module Views 
    module Pages
      class Base < Arbre::HTML::Document
       
        def build_title_bar
          insert_tag view_factory.title_bar, titles, action_items_for_action, active_admin_namespace
        end

        def titles
          {
            index: title,
            link: config[:link_title] || active_admin_config.get_page_presenter(:form).options[:link_title] || title
          }
        end
      end#Base
    end#Pages
    class TitleBar < Component

      def build(titles, action_items, namespace)
        super(id: 'title_bar')
        @title = titles[:index]
        @titles = titles
        @action_items = action_items
        @namespace = namespace
        @utility_menu = @namespace.fetch_menu(:utility_navigation)
        build_level_elements  
      end

      private

      def build_level_elements        
        level1 = params[:action] == 'index' || active_admin_config.get_page_presenter(:form).options[:level1]
        if level1
          build_left_element
          build_right_element
        else
          build_left_element('level2')
        end
      end

      def build_left_element(level2 = nil)
        div class: "titlebar_left_element #{level2}" do
          build_custom_action
          build_titlebar_link
        end
      end

      def build_right_element
        div class: 'titlebar_right_element' do
          build_utility_navigation
        end
      end

      def build_custom_action
        link = ''
        case params[:action]
        when 'index'
          link = div class: 'new_element' do
                   link_to new_resource_path do              
                     helpers.content_tag(:div, '+', class: 'plus_element') <<
                     helpers.content_tag(:span, @titles[:link])
                   end
                 end
        else
          if active_admin_config.get_page_presenter(:form).options[:level1]
            link = div '', class: 'level1'
          else
            link = div class: 'index_element' do
              link_to @titles[:link], collection_path
            end
          end
        end
        link
      end

      def get_my_link(link,title)
      end

      def build_titlebar_link
        link = active_admin_namespace.site_title_link.blank? ? '/' : active_admin_namespace.site_title_link
        div id: 'titlebar_link' do
          helpers.link_to I18n.t('active_admin.title_bar.link'), link, 'target' => '_blank'
        end
      end

      def build_utility_navigation
        insert_tag view_factory.utility_navigation, @utility_menu, id: 'utility_nav', class: 'header-item tabs'
      end 
    end#TitleBar
  end#Views
end#ActiveAdmin