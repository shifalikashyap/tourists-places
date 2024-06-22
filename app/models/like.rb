class Like < ApplicationRecord
  belongs_to :likeable, counter_cache: true, polymorphic: true
  # validates :place_id, uniqueness: { scope: :user_id }
  validates :likeable_id, uniqueness: { scope: [:likeable_id, :like_by_id] }
end
