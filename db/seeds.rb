# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Location.destroy_all

fl_wpb = Location.create!(city: "West Palm Beach", state: "FL")
fl_ol = Location.create!(city: "Orlando", state: "FL")
co_denver = Location.create!(city: "Denver", state: "CO")
md_baltimore = Location.create!(city: "Baltimore", state: "MD")
tx_midland = Location.create!(city: "Midland", state: "TX")

User.create!(email: "harrison@email.com", password: "test", name: "Harrison Blake",
            location: co_denver, gender: 0, age: 26)

User.create!(email: "michann@email.com", password: "test", name: "Michann Stoner",
              location: co_denver, gender: 1, age: 27)

User.create!(email: "sarah@email.com", password: "test", name: "Sarah Lane",
              location: co_denver, gender: 1, age: 33)

User.create!(email: "andrew@email.com", password: "test", name: "Andrew Carlin",
              location: fl_wpb, gender: 0, age: 25)

User.create!(email: "dusty@email.com", password: "test", name: "The Dust",
              location: fl_ol, gender: 0, age: 90)

User.create!(email: "wyatt@email.com", password: "test", name: "Wyatt Wicks",
              location: co_denver, gender: 0, age: 27)

User.create!(email: "mrtest@gmail.com", password: "newtest", name: "Mr. Test",
            age: 60, location: fl_ol, gender: 2)

User.create!(email: "coolemail@email.com", password: "80209", name: "testy mctester",
            age: 6, location: md_baltimore, gender: 1)

User.create!(email: "jeffbezos@amazon.com", password: "dragon", name: "Jeff Bezos",
            location: tx_midland, gender: 0, age: 90)

User.create!(email: "monstersquid@wow.com", password: "5692P3", name: "Random Name",
              location: fl_wpb, gender: 3, age: 42)

User.create!(email: "josie@okayestdogever.com", password: "paininthea**", name: "Josie Bella",
              location: co_denver, gender: 2, age: 2)

User.create!(email: "basshero@blink182.com", password: "5678", name: "Mark Hoppus",
              location: fl_ol, gender: 1, age: 40)

User.create!(email: "anothertestuser@turing.com", password: "turing1", name: "Bob Gu",
              location: tx_midland, gender: 1, age: 30)

User.create!(email: "bigpapa@hiphop.com", password: "money", name: "Biggy Smalls",
              location: tx_midland, gender: 0, age: 56)

User.create!(email: "loki@marvel.com", password: "gloriouspurpose", name: "Loki Odinson",
              location: fl_wpb, gender: 2, age: 2300)

User.create!(email: "imrunningoutofideas@imalloutofideas.com", password: "w68d^42z", name: "Needmore Ideas",
              location: fl_wpb, gender: 3, age: 90)

User.create!(email: "coffee@coffee&beer.com", password: "coffee", name: "Spider Man",
              location: fl_ol, gender: 3, age: 15)

User.create!(email: "avalanche@hockey.com", password: "stanley_cup", name: "Joe Sakic",
              location: co_denver, gender: 3, age: 56)

User.create!(email: "rick@morty.com", password: "summer", name: "Rick Sanchez",
              location: md_baltimore, gender: 3, age: 30)

User.create!(email: "frodo@theonering.com", password: "elf", name: "Frodo Baggins",
              location: tx_midland, gender: 1, age: 24)

User.create!(email: "dumbledore@harrypotter.com", password: "phoenix", name: "Albus Dumbledore",
              location: tx_midland, gender: 1, age: 29)
