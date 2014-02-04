module Postable
  extend ActiveSupport::Concern

  included do
    after_create :send_post, if: :facebook?
  end

  private

  def send_post
    puts "================ #{self.image_url}"
    Facebook.instance.post self.form_facebook_message
  end
end
