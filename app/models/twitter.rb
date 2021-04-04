#gets the twitter gem that allows the twitter API to work
require 'twitter'
#providing the required information to allow the API call
module Twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "wTqru670zPIZ9f9SwZrxfF2sD"
    config.consumer_secret     = "0riuwgZYdfVx1vE1awXoDd5f4nj5I8zO4kmQfVs16reFuyisau"
    config.access_token        = "737957816359587840-YfMSn69aouWlb4V7kh8c78w2kU53f5K"
    config.access_token_secret = "vozKqJkPY83lasCdgrOiCOR6ITmtCHZRdvF6gmKcVcw8I"
  end

  #searches for tweets with the hast tag rubyonrails excluding retweets and in the english language
  tweets = client.search("#rubyonrails -rt", lang: "en").each()
  tweets.each { |tweet| puts tweet.full_text }

end




