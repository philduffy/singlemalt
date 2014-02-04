module Postable
  extend ActiveSupport::Concern

  included do
    after_commit :send_post, if: :facebook?
  end

  private

  def send_post
    if self.new_record?
      Facebook.instance.post self.form_facebook_message
    end
  end
end
