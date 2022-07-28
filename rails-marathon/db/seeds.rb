# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
gryf = House.create(name: "Gryffindor", source: "Harry Potter", author: "J.K.")
huff = House.create(name: "Hufflepuff", source: "Harry Potter", author: "J.K.")

harry = Member.create(first_name: 'Harry', last_name: 'Potter', house: gryf)
dumbledore = Member.create(first_name: 'Albus', last_name: 'Dumbledore', house: huff)