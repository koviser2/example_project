class PagesController < ApplicationController
  before_filter :validate_user, only: [:get_about_info]

  def index
  end

  def work
    render :index
  end

  def show_work
    @work_page    = params[:page]
    @show_work_id = params[:id].to_i
    render :index
  end

  def show_location
    @location_page    = params[:page]
    @show_location_id = params[:id].to_i
    render :index
  end
  
  def about
    render :index
  end

  def casting
    render :index
  end

  def show_casting
    @casting_page     = params[:page]
    @casting_type     = params[:type]
    @casting_pictures = Casting.where(people_type: params[:type])
    @casting_pictures = custom_sort(@casting_pictures, 16)
    render :index
  end

  def locations
    render :index
  end

  def clients
    render :index
  end

  def get_skins
    views = [6, 5, 5, 6, 4]
    reque = if params["id"] == "0"
              Skin.show().joins(:awards).uniq
            else
              Skin.show().where(category: params["id"])
            end

    element_index = (categories.map{|el| el.id}.index(params[:id].to_i)) % views.size
    skins         = custom_sort(reque, views[element_index])

    unless skins.size > 0
      render :json => {skins: "no skins"}
      return
    end

    respond_to do |format|
      format.json {
        render partial: "shared/json/get_skins", locals: {skins: skins, cat: element_index+1}
      }
    end
  end

  def get_casting
    type     = params[:type].try(:to_i) || 0
    pictures = Casting.where(people_type: type)
    pictures = custom_sort(pictures, 16)

    respond_to do |format|
      format.json {
        render partial: "shared/json/get_casting", locals: {type: type, pictures: pictures}
      }
    end
  end

  def get_skin
    skin = Skin.find_by_id(params["id"])

    unless skin
      render :json => {skins: "no skin"}
      return
    end

    respond_to do |format|
      format.json {
        render partial: "shared/json/get_skin", locals: {skin: skin}
      }
    end
  end

  def get_locations
    locations = LocationPicture.show().where(location: params["id"])
    locations = custom_sort(locations, 5)

    respond_to do |format|
      format.json {
        render partial: "shared/json/get_locations", locals: {locations: locations}
      }
    end
  end

  def get_about_info
    respond_to do |format|
      format.json {
        render partial: "shared/json/get_about_info", locals: {user: get_ability}
      }
    end
  end

  def categories
    @categories ||=  Category.joins(:skins).uniq.where(show: true).where(skins: {show: true}) << OpenStruct.new({name: "Awarded", id: 0})
  end
  helper_method :categories

  private
    def padding_page(page, total, show)
      size = (page -1)*show
      size%total
    end

    def custom_sort(reque, show = 6)
      total = reque.count
      total = 1 if total == 0
      page  = params["page"].to_i
      page +=1 if params["page"].blank?
      skins = reque.page(1).per(show).padding(padding_page(page, total, show))

      if (skins.count < show) and (skins.count > 0)
        while skins.length < show do
          size  = show - skins.count
          skins = skins << reque.first(size)
          skins.flatten!
        end
      end

      skins
    end

    def get_ability
      @get_ability ||= About.find_by_id(params["id"])
    end

    def validate_user
      render :json => {success: false, errors: "user not found"} unless get_ability
    end
end