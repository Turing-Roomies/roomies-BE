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

User.create!(email: "mrtest@gmail.com", password: "test", name: "Sam Burbank",
            age: 60, location: fl_ol, gender: 2)

User.create!(email: "coolemail@email.com", password: "test", name: "Tony Scott",
            age: 27, location: md_baltimore, gender: 0)

User.create!(email: "jeffbezos@amazon.com", password: "test", name: "Jeff Bezos",
            location: tx_midland, gender: 0, age: 67)

User.create!(email: "monstersquid@wow.com", password: "test", name: "Abbey Gishal",
              location: fl_wpb, gender: 3, age: 42)

User.create!(email: "josie@okayestdogever.com", password: "test", name: "Josie Bella",
              location: co_denver, gender: 2, age: 21)

User.create!(email: "basshero@blink182.com", password: "5678", name: "Mark Hoppus",
              location: fl_ol, gender: 1, age: 40)

User.create!(email: "anothertestuser@turing.com", password: "test", name: "Bob Gu",
              location: tx_midland, gender: 1, age: 30)

User.create!(email: "bigpapa@hiphop.com", password: "money", name: "Ben Simmons",
              location: tx_midland, gender: 0, age: 26)

User.create!(email: "loki@marvel.com", password: "gloriouspurpose", name: "Loki Odinson",
              location: fl_wpb, gender: 2, age: 76)

User.create!(email: "ideas@ideas.com", password: "test", name: "Sam Stang",
              location: fl_wpb, gender: 3, age: 31)

User.create!(email: "coffee@coffee&beer.com", password: "coffee", name: "Steve Manchin",
              location: fl_ol, gender: 0, age: 29)

User.create!(email: "avalanche@hockey.com", password: "test", name: "Joe Sakic",
              location: co_denver, gender: 3, age: 56)

User.create!(email: "rick@morty.com", password: "summer", name: "Sarah Sandle",
              location: md_baltimore, gender: 1, age: 30)

User.create!(email: "frodo@theonering.com", password: "elf", name: "Tim Washington",
              location: tx_midland, gender: 1, age: 24)

User.create!(email: "dumbledore@harrypotter.com", password: "test", name: "Mina Bendebba",
              location: tx_midland, gender: 1, age: 29)
