module ActiveAdmin::Koviser
  module ControllerActions

    def client_drag_index(atribute = :drag_index)
      @config.namespace.resources.first.page_presenters[:index][:table].options[:class] = 'event_drag_index'
      sortable_method
    end#client_drag_index
   
    def level1
      @config.controller.class_exec do
        def index
          c = resource_class.last
          if c
            path = edit_resource_path(c) 
          else
            path = new_resource_path(c)
          end

          super do |format|
            redirect_to path and return
          end
        end
      end
    end#level1

    def tag_updates(type_ids = :key_ids)
      @config.controller.class_exec do
        before_filter :koviser_keys_update, only: [:update]
        private
          def koviser_keys_update(type_ids = :key_ids)
            params[resource_class.model_name.element][type_ids.to_s] = params[resource_class.model_name.element][type_ids.to_s].split(',')
          end
      end
    end#tag_updates

    private     
      def sortable_method
        @config.controller.class_exec do
          before_filter :form_update, only: [:update]

          def client_drag_index(atribute = :drag_index)
            array = JSON.parse(params['data']).try(:first).try(:last)

            if array
              size  = resource_class.name.size+1
              array = array.map{|x| x[size..-1].to_i}
              ids   = Hash[resource_class.where(id: array).pluck(:id, atribute)]

              if ids.size == array.size
                ActiveRecord::Base.transaction do
                  ids.each_with_index do |(id, drag), index|
                    unless id == array[index]
                      resource_class.find_by_id(array[index]).update_attribute(atribute, drag)
                    end
                  end
                end
              end

            end
            render :status => 200, :json => {:success => true}
          end#client_drag_index

          private
            def form_update
              element    = 'drag_index'
              new_index  = params[resource_class.model_name.element][element].to_i
              last_index = resource.try(element)

              unless  new_index == last_index
                plus = new_index > last_index ? -1 : 1
                array = [] << new_index << last_index
                array.sort!
                array = Range.new(array[0], array[-1])
                resource_class.where( element => array).where.not(element => last_index).each do |client|
                  attribute = client.try(element).to_i + plus
                  client.update_attributes(element => attribute)
                end
              end
            end

        end#@config.controller
      end#sortable_method


  end#ControllerActions

  ::ActiveAdmin::ResourceDSL.send(:include, ControllerActions)
end