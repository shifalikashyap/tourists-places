class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :latitude, :longitude, :state, presence: true
  has_many :likes, as: :likeable
  has_one_attached :image_url
  has_many_attached :images

  #has_many_attached :profile_images (for more than one image)

  def place_title
    "#{name}, #{city}(#{state})"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "description", "id", "image_url", "latitude", "longitude", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
