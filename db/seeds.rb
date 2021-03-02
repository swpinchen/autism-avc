# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# -User Columns -
#     t.string "name"
#     t.bigint "parent_id", null: false
#     t.integer "roles"
#     t.string "theme"
#     t.string "username"
#     t.date "birthday"

puts 'Creating users...'
user_email_list = ['s_pinchen@hotmail.com', 'ivanwilf@gmail.com', 'natasha030320@gmail.com', 'hhknight@me.com']
user_list = []

user_email_list.length.times do |index|
  user = User.create!(email: user_email_list[index], password: "password", name: Faker::Name.name, birthday: Date.new(rand(2011..2015), rand(1..12), rand(1..28)))
  user_list << user
  puts "User #{user.id}: #{user.email} was created!"
end

item = Item.new(title:
start_date: Faker::Time.forward(days: 23, period: :morning),
end_date: Faker::Time.forward(days: 23, period: :evening),
deletable: false
editable: false
category: "task"
recurring: false
completed: false
details:
)

# title
# image
# start_date
# child_id
# details
# deletable
# editable
# category
# end_date
# recurring
# completed



# clinic = Clinic.create!(name: "Stuart's Dentistry",
#   location: "Meguro 1-2-4, Meguro, Tokyo",
#   open_hours: "#{Faker::Time.backward(days: 0, period: :morning, format: :short)} - #{Faker::Time.forward(days: 0, period: :morning)}",
#   description: "We are better than Ivan's clinic. More than half the patients that come here end up getting better. We are located in the heart of Tokyo!",
#   # specialities: "general practice",
#   user: user_list.sample,
# )
# file = URI.open('https://images.unsplash.com/photo-1567568443997-19f025355d52?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80')

