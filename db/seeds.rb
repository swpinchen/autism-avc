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