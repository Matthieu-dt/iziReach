class Company < ApplicationRecord
  belongs_to :user
  has_many :campaigns
  has_many :bookings, through: :campaigns
end
