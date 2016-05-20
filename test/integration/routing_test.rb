require 'test_helper'
include Warden::Test::Helpers
class RoutingTest < ActionDispatch::IntegrationTest
  
  test "main routs" do
    default = {locale: I18n.default_locale}
    methods = [:root_path, :work_path, :about_path, :casting_path,
              :casting_women_path, :casting_men_path, :casting_kids_path,
              :locations_path, :clients_path
              ]
    met_params = {
      show_work_path: {id: skins(:one).id},
      show_location_path: {id: locations(:one).id}
    }
    methods.each do |method|
      get self.send(method, default)
    end
    met_params.each do |key, attr|
      get self.send(key, default.merge(attr))
    end
    assert_response :success  
  end

  test "admin routs" do
    get "/admin"
    url = [
            :awards, :skins, :categories, :teams,
            :abouts, :locations, :user_changes, :admin_users,
            :about_dashboards, :casting_dashboards, :location_dashboards, :client_dashboards
          ]
    login_as admin_users(:one)
    url.each do |link|
      get "/admin/#{link.to_s}"
      get "/admin/#{link.to_s}/new"
      get "/admin/#{link.to_s}/#{self.send(link, :one).id}/edit"
    end
    assert_response :success
  end

end