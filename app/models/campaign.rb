class Campaign < ApplicationRecord
  belongs_to :company
  has_many :bookings, dependent: :destroy
  has_many :influencers, through: :bookings
end
