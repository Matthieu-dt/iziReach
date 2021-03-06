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

usernames = ["matthieu_dt", "valeskaschneider", "konstantin.nico", "adventureravi", "danidelgadosk8", "bk_blog", "27ruecosy", "vin__cen", "anne_dressingideal"]
prices = [20, 25, 30, 35, 40]
boolean = [true, false, false, false]
# article = Article.new(title: 'NES', body: "A great console")


puts "Creating 9 fake influencers"
usernames.each do |username|
  influencer = Influencer.new(
    first_name:       Faker::Name.first_name,
    last_name:        Faker::Name.last_name,
    user_name:        username,
    price_per_photo:  prices.sample,
    price_per_video:  prices.sample,
    price_per_story:  prices.sample,
    price_per_live:   prices.sample,
    lifestyle:        boolean.sample,
    sport:            boolean.sample,
    food:             boolean.sample,
    gaming:           boolean.sample,
    healthy:          boolean.sample,
    travel:           boolean.sample,
    music:            boolean.sample,
    fashion:          boolean.sample,
    art:              boolean.sample,
    technology:       boolean.sample,
    humour:           boolean.sample,
    beauty:           boolean.sample,
    user:             user = User.new(
        email:              Faker::Internet.email,
        password:           "password1234"
        ),
  )
  user.save!
  influencer.save!
  puts "Influencer created"
end

puts "Creating 9 photos for each influencer"
Influencer.all.each do |influencer|
      9.times do
      file = URI.open('https://source.unsplash.com/random')
      influencer.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    end
  puts "9 photos uploaded"
  end
