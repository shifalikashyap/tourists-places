class Hotel < ApplicationRecord
  has_many :likes, as: :likeable
end
