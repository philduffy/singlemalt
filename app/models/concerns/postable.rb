module Postable
  extend ActiveSupport::Concern

  included do
    after_commit :send_post, if: :facebook?
  end

  private

  def send_post
    return if self.facebooked_at.present?

    Facebook.instance.post self.form_facebook_message
    touch :facebooked_at
  end
end
