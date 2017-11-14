class Event < ApplicationRecord
  attachment :event_image, type: :image

  validates  :name, presence: true, length: { maximum: 50 }
  validates  :description, presence: true, length: { maximum: 1000 }
end
