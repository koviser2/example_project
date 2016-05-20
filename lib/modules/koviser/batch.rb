
module ActiveAdmin

  module BatchActions
    # Creates the toggle checkbox used to toggle the collection selection on/off
    class ResourceSelectionToggleCell < ActiveAdmin::Component
      def build
        input(type: "checkbox", id: "collection_selection_toggle_all", name: "collection_selection_toggle_all", class: "toggle_all") +
        label("for" => "collection_selection_toggle_all")
      end
    end
    # Creates the checkbox used to select a resource in the collection selection
    class ResourceSelectionCell < ActiveAdmin::Component
      def build(resource)
        input(type: "checkbox", id: "batch_action_item_#{resource.id}", value: resource.id, class: "collection_selection", name: "collection_selection[]") + 
        label("for" => "batch_action_item_#{resource.id}")
      end
    end   
  end
  
  class Resource   
      def links(*args, &block)
        options = args.extract_options!
        method = args.first

        links_config[:method]  = block || method
        links_config[:expect]  = options[:expect] || []
        links_config[:only]    = options[:only] || []
        links_config[:methods] = args
      end

      def links_expect
        links_config[:expect]
      end

      def links_only
        links_config[:only]
      end

      def links_methods
        links_config[:methods]
      end

      def links_method
        links_config[:method]
      end

      def links_config
        @links_config ||= {
          method: nil,
          expect: nil,
          only: nil,
          methods: nil
        }
      end

      def links?(context = nil)
        return false if links_method.nil? || links_method == false
        true
      end
  end#Resource

  class ResourceDSL < DSL
    def links(*args, &block)
      config.links(*args, &block)
    end
    def index(options = {}, &block)
      options[:as] ||= :table
      options[:config] = config
      config.set_page_presenter :index, ActiveAdmin::PagePresenter.new(options, &block)
    end
  end#ResourceDSL
end
