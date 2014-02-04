class Thing < ActiveRecord::Base
  include Postable
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
  def form_facebook_message
    {
      message: "I just added #{self.name} to my list of things on my site.",
      picture: self.image_url,
      link: self_url,
      name: self.name
    }
  end

  def form_tweet_message
    base = "I added a new thing:"
    message = self.name

    "#{base} #{message} - #{self_url}"
  end

  private

  def self_url
    Rails.application.routes.url_helpers.
      thing_url(self, host: 'http://www.single-malt.co')
  end

  def set_defaults
    self.facebook = false if self.facebook.nil?
    self.tweet = false if self.tweet.nil?

    true
  end
end
