class Company < ApplicationRecord
  belongs_to :user
  has_many :campaigns
  has_many :bookings, through: :campaigns
  has_one_attached :photo


  validates :name, :description, :values, :url, :photo, presence: true
  
end
