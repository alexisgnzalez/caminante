class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :locations, -> { order "id ASC" }
  has_many_attached :photos
end
