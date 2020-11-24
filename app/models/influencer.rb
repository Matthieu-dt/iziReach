class Influencer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, :last_name, :user_name, :price_per_story, :price_per_photo, :price_per_video, :price_per_live, presence: true
  validates :price_per_story, :price_per_photo, :price_per_video, :price_per_live, numericality: true
end
