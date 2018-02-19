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

User.create!([
  {username:"Admin", email: "testadmin@mvmanor.co.uk", password: "testadminuser", password_confirmation: "testadminuser",  admin: true},
  {username:"testuser", email: "testuser@mvmanor.co.uk", password: "testuseraccount", password_confirmation: "testuseraccount", admin: false},
  {username:"testcustomer", email: "testcustomer@customer.co.uk", password: "testcustomeruser", password_confirmation: "testcustomeruser", admin: false},
  {username:"testcustomer2", email: "testcustomer2@customer.co.uk", password: "testcustomeruser2", password_confirmation: "testcustomeruser2",admin: false}
])

Invitation.create!([
	{ user_id: 2, event_id: 2, confirmed: true, interested: true},
	{ user_id: 1, event_id: 4, confirmed: false, interested: true},
	{ user_id: 3, event_id: 3, confirmed: false, interested: true},
	{ user_id: 2, event_id: 2, confirmed: false, interested: false},
	{ user_id: 4, event_id: 2, confirmed: true, interested: false}
	])
