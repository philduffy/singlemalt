class Thing < ActiveRecord::Base
  include Sortable

  mount_uploader :image, ImageUploader

  # Validation9
  validates :image, presence: true
  validates :name, presence: true
  validates :url, presence: true, url: true

  # Methods
  def self.per_page
    9
  end
end
