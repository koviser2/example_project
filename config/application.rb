require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProntoFilms
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/models/ckeditor)
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:ua, :en]
    config.active_record.raise_in_transactional_callbacks = true
  end
end
