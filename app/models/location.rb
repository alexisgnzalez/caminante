class Location < ApplicationRecord
  belongs_to :tour
  has_many :activies
  has_many_attached :photos
  has_one_attached :model
  has_one_attached :view
end
