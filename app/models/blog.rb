class Blog < ActiveRecord::Base
  # Validations
  validates :content, presence: true
  validates :title, presence: true
end
