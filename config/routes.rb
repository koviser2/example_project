Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    root 'pages#index'
    get "work" => "pages#work", as: :work
    get "work/:id" => "pages#show_work", as: :show_work
    get "about" => "pages#about", as: :about
    get "casting" => "pages#casting", as: :casting
    get "casting/women" => "pages#show_casting", as: :casting_women, defaults: {type: 0}
    get "casting/men" => "pages#show_casting", as: :casting_men, defaults: {type: 1}
    get "casting/kids" => "pages#show_casting", as: :casting_kids, defaults: {type: 2}
    get "locations" => "pages#locations", as: :locations
    get "locations/:id" => "pages#show_location", as: :show_location
    get "clients" => "pages#clients", as: :clients
    match "get_skins" => "pages#get_skins", :format => :json, via: [:get,:post]
    match "get_skin" => "pages#get_skin", :format => :json, via: [:get,:post]
    match "get_locations" => "pages#get_locations", :format => :json, via: [:get,:post]
    match "get_about_info" => "pages#get_about_info", :format => :json, via: [:get,:post]
    match "get_casting" => "pages#get_casting", :format => :json, via: [:get,:post]
  end

  root to: redirect(:status => 302) {|_, request|
    finded_locale = request.env['HTTP_ACCEPT_LANGUAGE'] ? request.env['HTTP_ACCEPT_LANGUAGE'].scan(/\A([a-z]{2})/).first.first.to_sym : nil
    I18n.available_locales.include?(finded_locale) ? finded_locale : I18n.default_locale
  }, as: :redirected_root

end
