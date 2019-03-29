require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CheckApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

def load_config(key, filepath)
  yml = YAML.load_file(filepath).symbolize_keys
  raise "No such file #{filepath}" if yml.blank?

  config = yml[Rails.env.to_sym]
  raise "No such environment #{Rails.env} on #{filepath}" if config.blank?

  Rails.application.config.send("#{key}=", ActiveSupport::InheritableOptions.new(config.deep_symbolize_keys))
end

load_config(:source, Rails.root.join('config', 'source.yml'))  #ource.ymlを読み込み