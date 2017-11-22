class Event < ApplicationRecord
  attachment :event_image, type: :image

  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy

  has_many :recordings, dependent: :destroy
  has_many :users, through: :recordings 

  validates  :name, presence: true, length: { maximum: 50 }
  validates  :description, presence: true, length: { maximum: 1000 }
  validates  :event_image, presence: true

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
  	self.tags = names.split(',').map do |name|
  		Tag.where(name: name.strip).first_or_create
  	end
  end

  scope :search_by_attributes, -> (query) { where("name || ' ' || description ILIKE ?", "%#{query}%").order(created_at: :desc) }
end
