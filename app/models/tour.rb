class Tour < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings
  has_many :locations, -> { order "id ASC" }
  has_many_attached :photos
  # pg_search_scope :search_by_description,
  pg_search_scope :search_by_description,
                against: [:name, :description],
  #               associated_against: {
  #                 location: [:name, :description]
  #               },
                using: {
                  tsearch: { prefix: true }
                }
end
