require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.session_store :cache_store
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

   config.cache_store = :null_store
  end

  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  #youtube api set up
  Yt.configure do |config|
    config.api_key = 'AIzaSyDvkt2GI7OhcbAPZyjoqmynqQrp9NVk1To'
    config.log_level = :debug
  end

  #twitter api set up
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "wTqru670zPIZ9f9SwZrxfF2sD"
    config.consumer_secret     = "0riuwgZYdfVx1vE1awXoDd5f4nj5I8zO4kmQfVs16reFuyisau"
    config.access_token        = "737957816359587840-YfMSn69aouWlb4V7kh8c78w2kU53f5K"
    config.access_token_secret = "vozKqJkPY83lasCdgrOiCOR6ITmtCHZRdvF6gmKcVcw8I"
  end

end
