class Location < ApplicationRecord
  belongs_to :tour
  has_many :activies
end
