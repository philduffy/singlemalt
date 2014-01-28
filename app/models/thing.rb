class Thing < ActiveRecord::Base
  include Sortable

  mount_uploader :image, ImageUploader

  # Validations
  validates :image, presence: true
  validates :name, presence: true
  validates :url, presence: true, url: true
end
