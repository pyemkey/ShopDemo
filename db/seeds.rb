# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
11.times do |index|
  user = User.create(email: Faker::Internet.email,
                   password: "test1234",
                   name: Faker::Internet.user_name)
  l = Listing.create(name: "loker",
               description: Faker::Lorem.paragraphs(1).join(" "),
                price: rand(1..268),
                listing_image: File.open(Rails.root.join("public/assets/#{index+1}.jpg")),
                user: user)
end


