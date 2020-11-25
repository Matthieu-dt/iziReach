class Influencer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, :last_name, :user_name, :description, :price_per_story, :price_per_photo, :price_per_video, :price_per_live, presence: true
  validates :price_per_story, :price_per_photo, :price_per_video, :price_per_live, numericality: true

  def set_rating
    total = 0
    self.bookings.each do |booking|
      if booking.review
        total += booking.review.rating
      end
    end
    count = 0
    self.bookings.each do |booking|
      if booking.review
        count += 1
      end
    end
    if count == 0
      self.rating = 0
    else
    self.rating = total / count
    end
  end
end
