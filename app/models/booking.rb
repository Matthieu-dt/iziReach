class Booking < ApplicationRecord
  belongs_to :campaign
  has_one :review, dependent: :destroy
  belongs_to :influencer
end
