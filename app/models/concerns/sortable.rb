module Sortable
  extend ActiveSupport::Concern

  included do
    scope :newest_first, -> { order('created_at DESC') }
  end
end
