module ActiveAdmin
  module Views 
    class IndexAsTable < ActiveAdmin::Component   

          def build(page_presenter, collection)
            table_options = {
              id:        "index_table_#{active_admin_config.resource_name.plural}",
              sortable:  true,
              class:     'index_table index',
              i18n:      active_admin_config.resource_class,
              paginator: page_presenter[:paginator] != false,
              row_class: page_presenter[:row_class],
              config:    page_presenter[:config]
            }
            
            table_for collection, table_options do |t|
              table_config_block = page_presenter.block || default_table
              instance_exec(t, &table_config_block)
            end
          end
             
          class IndexTableFor < ::ActiveAdmin::Views::TableFor
            def actions(options = {}, &block)
              name          = options.delete(:name) do 
                div class: 'show_filters' do
                  I18n.t 'active_admin.filter_in_menu'
                end
              end
              defaults      = options.delete(:defaults) { true }
              dropdown      = options.delete(:dropdown) { false }
              dropdown_name = options.delete(:dropdown_name) { I18n.t 'active_admin.dropdown_actions.button_label', default: 'Actions' }

              options[:class] ||= 'col-actions'

              column name, options do |resource|
                if dropdown
                  dropdown_menu dropdown_name do
                    defaults(resource) if defaults
                    instance_exec(resource, &block) if block_given?
                  end
                else
                  table_actions do
                    defaults(resource, css_class: :member_link) if defaults
                    if block_given?
                      block_result = instance_exec(resource, &block)
                      text_node block_result unless block_result.is_a? Arbre::Element
                    end
                  end
                end
              end
            end  

         # Display a column for checkbox
        def selectable_column
          return unless active_admin_config.batch_actions.any?
          column my_resource_selection_toggle_cell, class: 'col-selectable', sortable: false do |resource|
            my_resource_selection_cell resource
          end
        end  
        # Creates the toggle checkbox used to toggle the collection selection on/off
        class MyResourceSelectionToggleCell < ActiveAdmin::Component
          builder_method :my_resource_selection_toggle_cell
          def build
            input(type: 'checkbox', id: 'collection_selection_toggle_all', name: 'collection_selection_toggle_all', class: 'toggle_all') +
            label('for' => 'collection_selection_toggle_all')
          end
        end
        # Creates the checkbox used to select a resource in the collection selection
        class MyResourceSelectionCell < ActiveAdmin::Component
          builder_method :my_resource_selection_cell
          def build(resource)
            input(type: 'checkbox', id: "batch_action_item_#{resource.id}", value: resource.id, class: 'collection_selection', name: 'collection_selection[]') + 
            label('for' => "batch_action_item_#{resource.id}")
          end
        end        
      end # IndexTableFor
    end # IndexAsTable

    class TableFor < Arbre::HTML::Table
      
      def build(obj, *attrs)
        options         = attrs.extract_options!
        @sortable       = options.delete(:sortable)
        @config         = options.delete(:config)
        @collection     = obj.respond_to?(:each) && !obj.is_a?(Hash) ? obj : [obj]
        @resource_class = options.delete(:i18n)
        @resource_class ||= @collection.klass if @collection.respond_to? :klass
        @columns        = []
        @row_class      = options.delete(:row_class)
        build_table
        super(options)
        columns(*attrs)
        generate_all_destroy
      end
      
      def generate_all_destroy
        if (@columns.size > 1) && @columns[0].html_class.index('col-selectable')
          within @thead do
            tr class: 'delete_many dropdown_menu batch_actions_selector' do
              td do
                div class: 'delete_many_div delete_many_div_first dropdown_menu_button disabled my_resource_selection_toggle_cell'
              end
              td colspan: (@columns.size - 1) do
                div class: 'delete_many_div delete_many_div_second table_tools dropdown_menu_button disabled' do
                  div class: 'my_batch_actions_selector ' do
                    div class: 'information my_dropdown_menu_list_wrapper' do
                      ul class: ' dropdown_menu_list' do
                        li do
                          a 'class' => 'batch_action', 'data-action' => 'destroy', 'data-confirm' => I18n.t('active_admin.delete_confirmation'), 'data-inputs' => 'null', href: '#' do
                            I18n.t('active_admin.batch_actions.action_label', title: I18n.t('active_admin.batch_actions.labels.destroy'))
                          end#a
                        end#li
                      end#ul
                    end#my_dropdown_menu_list_wrapper
                  end#batch_actions_selector
                end#table_tools
              end#td
            end#tr
          end#within
        end#if
      end#generate_all_destroy

      def column(*args, &block)
        elem = args.first
        if @config
          link = @config.links? && 
                 elem.is_a?(Symbol) &&
                 block.is_a?(NilClass) &&
                 (@config.links_method == :all ||
                 @config.links_only.include?(elem) ||
                 @config.links_methods.include?(elem)) &&
                 !@config.links_expect.include?(elem)
        else
          link = elem.is_a?(Symbol) && block.is_a?(NilClass)
        end

        options = default_options.merge(args.extract_options!)
        title   = args[0]
        data    = args[1] || args[0]
        col     = Column.new(title, data, @resource_class, options, &block)
      
        @columns << col
        # Build our header item
        within @header_row do
          build_table_header(col)
        end

        # Add a table cell for each item
        @collection.each_with_index do |item, i|
          within @tbody.children[i] do
            if link
              build_table_cell_link col, item
            else
              build_table_cell col, item
            end
          end
        end
      end

      def build_table_cell_link(col, item)#3
        td class: col.html_class do#2 
          a href: edit_resource_path(item) do#1 
            render_data col.data, item
          end#1
        end#2
      end#3     
    end#TableFor
  end
end