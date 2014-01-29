class Thing < ActiveRecord::Base
  include Sortable
  include Tweetable

  # Callbacks
  before_validation :set_defaults

  # Attributes
  mount_uploader :image, ImageUploader

  # Validation9
  validates :image, presence: true
  validates :name, presence: true
  validates :url, presence: true, url: true

  # Methods
  def self.per_page
    9
  end

  def form_tweet_message
    base = "I added a new thing:"
    message = self.name
    url = Rails.application.routes.url_helpers.
      thing_url(self, host: 'http://www.single-malt.co')

    "#{base} #{message} - #{url}"
  end

  private

  def set_defaults
    self.tweet = false if self.tweet.nil?

    true
  end
end
