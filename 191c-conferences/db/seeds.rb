# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

guest1 = Guest.create! name: "Jill"
guest2 = Guest.create! name: "Jack"

venue1 = Venue.create! venue_name: "Boulder Theatre"
venue2 = Venue.create! venue_name: "Oregon Convention Center"
venue3 = Venue.create! venue_name: "St. Julien's Hotel"

conf1 = Conference.create! conf_name: "Rocky Mountain Ruby", venue_id: venue1
conf2 = Conference.create! conf_name: "Ignite Boulder", venue_id: venue1
conf3 = Conference.create! conf_name: "Rails Conference", venue_id: venue2
conf4 = Conference.create! conf_name: "Big Boulder", venue_id: venue3

hotel1 = Hotel.create! hotel_name: "Boulderado"
hotel2 = Hotel.create! hotel_name: "Millenium"
hotel3 = Hotel.create! hotel_name: "Boulder Inn"
hotel4 = Hotel.create! hotel_name: "Double Tree"
hotel5 = Hotel.create! hotel_name: "Crowne Plaza"
hotel6 = Hotel.create! hotel_name: "Red Lion"
hotel7 = Hotel.create! hotel_name: "Courtyard"
hotel8 = Hotel.create! hotel_name: "St. Julien's Hotel"
hotel9 = Hotel.create! hotel_name: "Boulder Marriott"

conf1.hotels << hotel1
conf1.hotels << hotel2
conf1.hotels << hotel3
conf2.hotels << hotel1
conf2.hotels << hotel2
conf2.hotels << hotel3
conf3.hotels << hotel4
conf3.hotels << hotel5
conf3.hotels << hotel6
conf3.hotels << hotel7

Reservation.create! guest_id: guest1, conf_id: conf1, hotel_id: hotel1, price_paid: "250"
Reservation.create! guest_id: guest2, conf_id: conf1, hotel_id: hotel1, price_paid: "250"
Reservation.create! guest_id: guest2, conf_id: conf2, hotel_id: hotel2, price_paid: "10"