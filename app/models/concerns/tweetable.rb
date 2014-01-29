module Tweetable
  extend ActiveSupport::Concern

  included do
    after_create :send_tweet, if: :tweet?
  end

  private

  def send_tweet
    Tweeter.instance.tweet self.form_tweet_message
  end
end
