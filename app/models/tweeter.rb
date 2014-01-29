class Tweeter
  include Singleton

  CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY']
  CONSUMER_SECRET = ENV['TWITTER_CONSUMER_SECRET']
  OAUTH_TOKEN = ENV['TWITTER_ACCESS_TOKEN']
  OAUTH_TOKEN_SECRET = ENV['TWITTER_ACCESS_SECRET']

  def initialize
    @twitter = begin
      Twitter::REST::Client.new do |config|
        config.consumer_key = CONSUMER_KEY
        config.consumer_secret = CONSUMER_SECRET
        config.oauth_token = OAUTH_TOKEN
        config.oauth_token_secret = OAUTH_TOKEN_SECRET
      end
    end
  end

  def tweet(message)
    @twitter.update(message)
  end
end
