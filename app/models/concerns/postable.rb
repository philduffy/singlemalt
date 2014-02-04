module Postable
  extend ActiveSupport::Concern

  included do
    after_create :send_post, if: :facebook?
  end

  private

  def send_post
    object = self.reload

    Facebook.instance.post object.form_facebook_message
  end
end
