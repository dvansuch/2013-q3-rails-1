# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Employee.create! id: 1, name: "John", company_id: 1
Employee.create! id: 2, name: "Jill", company_id: 2
Employee.create! id: 3, name: "Jack", company_id: 2
Employee.create! id: 4, name: "Ursula", company_id: nil

Company.create! company_name: "Microsoft"
Company.create! company_name: "IBM"
Company.create! company_name: "Sun"
