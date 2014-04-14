# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
alphabet = ("a".."z").to_a
11.times do |index|
  user = User.create(email: Faker::Internet.email,
                   password: "test1234",
                   name: Faker::Internet.user_name)
  l = Listing.create(name: "loker",
               description: Faker::Lorem.paragraphs(1).join(" "),
                price: rand(1..268),
                listing_image: URI.parse("https://dl.dropboxusercontent.com/u/271407585/#{alphabet[index]}.jpg"),
                user: user)
end


