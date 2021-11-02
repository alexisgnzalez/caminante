class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :locations
  has_many :reviews
end
