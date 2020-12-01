# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

Booking.destroy_all
Influencer.destroy_all

usernames = ["matthieu_dt", "valeskaschneider", "konstantin.nico", "adventureravi", "danidelgadosk8", "lewagonparis"]
prices = [20, 25, 30, 35, 40]
# article = Article.new(title: 'NES', body: "A great console")


puts "Creating 6 fake influencers"
usernames.each do |username|
  influencer = Influencer.new(
    first_name:       Faker::Name.first_name,
    last_name:        Faker::Name.last_name,
    user_name:        username,
    price_per_photo:  prices.sample,
    price_per_video:  prices.sample,
    price_per_story:  prices.sample,
    price_per_live:   prices.sample,
    user:             user = User.new(
        email:              Faker::Internet.email,
        password:           "password1234"
        ),
  )
  user.save!
  influencer.save!
  puts "Influencer created"
end

Influencer.all.each do |influencer|
      9.times do
      file = URI.open('https://source.unsplash.com/random')
      influencer.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    end
  end
