module PagesHelper
  
  def main_skins
    @main_skins ||= Skin.show().unscope(:order).order("RANDOM()").limit(4)
  end

  def locations
    @locations ||=  Location.joins(:location_pictures).uniq.where(show: true).where(location_pictures: {show: true})
  end

  def location_main
    @location_main ||= LocationDashboard.last
  end

  def casting_main
    @casting_main ||= CastingDashboard.last
  end

  def about_main
    @about_main ||= AboutDashboard.last
  end

  def  client_main
    @client_main ||= ClientDashboard.last
  end

  def client_logos
    @client_logos ||= Client.show().all
  end

  def about_users
    unless @about_users
      @about_users = About.all
      even,odd     = [],[]

      @about_users.each_with_index do |user, index|
        ar = index.even? ? even : odd
        ar << user
      end

      @about_users = even.reverse + odd      
    end

    @about_users
  end

  def user_first
    @user_first ||= About.first
  end

end
