# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning up db...'
Item.destroy_all
puts 'All items deleted'
User.destroy_all
puts 'All users deleted.'


puts 'Creating users...'
user_email_list = ['s_pinchen@hotmail.com', 'ivanwilf@hotmail.com', 'natasha030320@gmail.com', 'hhknight@me.com']
user_list = []

user_email_list.length.times do |index|
  user = User.create!(email: user_email_list[index], password: "password", name: Faker::Name.name, birthday: Date.new(rand(2011..2015), rand(1..12), rand(1..28)), username: user_email_list[index].match(/(\S+)(@)(\S+)/)[1])
  user_list << user
  puts "User #{user.id}: #{user.email} was created!"
  3.times do
    item = Item.new(title: "Task name", start_date: DateTime.now, end_date: DateTime.new(2021,rand(4..12), rand(1..30)), category: "task,", details: Faker::Movies::StarWars.quote)
    item.user = user
    item.save!
    puts "Task for #{user.name} created"
  end
end
