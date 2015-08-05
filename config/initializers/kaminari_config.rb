Kaminari.configure do |config|
  config.default_per_page = Settings.default_per_page
  config.window = Settings.window
  config.param_name = Settings.param_name
end
