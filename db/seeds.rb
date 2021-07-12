# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fl = Location.create!(city: "West Palm Beach", state: "FL")
co = Location.create!(city: "Denver", state: "CO")
md = Location.create!(city: "Baltimore", state: "MD")

User.create!(email: "harrison@email.com", password: "test", name: "Harrison Blake",
             location: co, gender: 0, age: 26)

User.create!(email: "michann@email.com", password: "test", name: "Michann Stoner",
              location: co, gender: 1, age: 27)

User.create!(email: "sarah@email.com", password: "test", name: "Sarah Lane",
              location: co, gender: 1, age: 33)

User.create!(email: "andrew@email.com", password: "test", name: "Andrew Carlin",
              location: fl, gender: 1, age: 25)

User.create!(email: "wyatt@email.com", password: "test", name: "Wyatt Wicks",
              location: co, gender: 1, age: 27)

User.create!(email: "mrtest@gmail.com", password: "newtest", name: "Mr. Test",
             age: 60, location: fl, gender: 2)

User.create!(email: "coolemail@email.com", password: "80209", name: "testy mctester",
             age: 6, location: md, gender: 1)

User.create!(email: "jeffbezos@amazon.com", password: "dragon", name: "Jeff Bezos",
             location: md, gender: 0, age: 90)
