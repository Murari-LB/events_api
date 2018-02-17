# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create( description: "Event-#{rand(1..99)}", event_type: "Birthday", date: Date.today+rand(1..30).days, duration: rand(1..10), host: "Name-#{rand(1..999)}", location: "Bangalore")
Event.create( description: "Event-#{rand(1..99)}", event_type: "Marriage", date: Date.today+rand(1..30).days, duration: rand(1..10), host: "Name-#{rand(1..999)}", location: "Bangalore")
Event.create( description: "Event-#{rand(1..99)}", event_type: "Naming Ceromony", date: Date.today+rand(1..30).days, duration: rand(1..10), host: "Name-#{rand(1..999)}", location: "Bangalore")
Event.create( description: "Event-#{rand(1..99)}", event_type: "Reception", date: Date.today+rand(1..30).days, duration: rand(1..10), host: "Name-#{rand(1..999)}", location: "Bangalore")
