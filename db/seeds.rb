# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
    User.create(name:Faker::Name.unique.name)
end

5.times do
    Auction.create(item:Faker::Food.unique.fruits, seller: User.all.sample)
end

10.times do
    Bid.create(bid:rand(1..100), bidder: User.all.sample, auction: Auction.all.sample)
end
