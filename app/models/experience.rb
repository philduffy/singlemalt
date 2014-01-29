class Experience < ActiveRecord::Base
  # Validations
  validates :description, presence: true
  validates :job, presence: true
  validates :name, presence: true
  validates :started_at, presence: true
  validates :url, url: true, allow_blank: true

  # Scopes
  scope :newest_first, -> { order('started_at DESC') }
end
