# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
actor1 = Actor.create! name: "Fred"
actor2 = Actor.create! name: "Lynne"
actor3 = Actor.create! name: "Cathy"

play1 = Play.create! play_name: "Macbeth"
play2 = Play.create! play_name: "Twelfth Night"
play3 = Play.create! play_name: "Hamlet"

Role.create! role_name: "Macbeth", actor: actor1, play: play1
Role.create! role_name: "Lady Macbeth", actor: actor2, play: play1
Role.create! role_name: "Viola", actor: actor2, play: play2

