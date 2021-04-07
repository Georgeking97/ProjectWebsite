# gem that allows the youtube API calls
require 'yt'
require 'singleton'

module YouTube
  module_function
  class Call
    include Singleton
    Yt.configuration.api_key = 'AIzaSyDvkt2GI7OhcbAPZyjoqmynqQrp9NVk1To'

    def video
      # requesting the video via the youtube API
      response = Yt::Video.new id: 'Qq9JRO8KI1w'
      # loading the video returned from the api call
      response.embed_html
    end
  end
end

