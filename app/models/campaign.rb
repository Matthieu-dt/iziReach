class Campaign < ApplicationRecord
  belongs_to :company
  has_many :bookings, dependent: :destroy
  has_many :influencers, through: :bookings
  has_one_attached :photo

  validates :status, presence: true, inclusion: { in: ["pending", "ongoing", "finished"]}
  validates :name, :description, :target, :status, :occurs_at, :number_of_stories, :number_of_photos, :number_of_videos, :number_of_lives, :photo, presence: true
end
