# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cell_phone1 = CellPhone.create! serial_number: "12345"
cell_phone2 = CellPhone.create! serial_number: "23456"
cell_phone3 = CellPhone.create! serial_number: "34567"

Person.create! name: "Jill", cell_phone: cell_phone1
Person.create! name: "Jack", cell_phone: cell_phone2
Person.create! name: "Bob", cell_phone: nil