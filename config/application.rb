require_relative 'boot'

require 'rails/all'

# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyTodo
  class Application < Rails::Application
    config.i18n.available_locales = [:en, :ru]
  end
end
