class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_filter :set_current_admin_user

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  def set_current_admin_user
    AdminUser.current = current_admin_user
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
