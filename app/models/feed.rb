# gets the twitter gem that allows the twitter API to work
require 'twitter'

module Feed
  module_function

  def call(id)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'An4dZgZVcata4oQYjnsSo0HRf'
      config.consumer_secret = 'bm1PctrqU8elVlNYhcuSOGAAlek8goYnfnT8XM3ois70FHml1t'
      config.access_token = '737957816359587840-rrNXjOp0Sxzgxt9pZiPyrN1ba9IQApB'
      config.access_token_secret = '5jIh5M2nu7B4Rnrcp9RNpHLRJNkIA9iyNuIYaT3ZX2v4q'
    end
    client.search("#{id} -rt", lang: 'en').take(10).each()
  end
end


