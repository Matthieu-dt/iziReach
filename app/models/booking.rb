class Booking < ApplicationRecord
  belongs_to :campaign
  has_one :review, dependent: :destroy
  belongs_to :influencer

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "refused"] }

  before_save :set_total_price

  private

  def set_total_price
    stories = self.influencer.price_per_story * self.campaign.number_of_stories
    photos = self.influencer.price_per_photo * self.campaign.number_of_photos
    videos = self.influencer.price_per_video * self.campaign.number_of_videos
    lives = self.influencer.price_per_live * self.campaign.number_of_lives
    self.total_price = stories + photos + videos + lives
  end
end
