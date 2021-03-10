# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_array = [
  'https://images.unsplash.com/photo-1588072432836-e10032774350?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8c2Nob29sfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
  'https://images.unsplash.com/photo-1575783970733-1aaedde1db74?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2255&q=80',
  'https://loveincorporated.blob.core.windows.net/contentimages/main/de53d2eb-1b56-4c62-a6c9-c6bcac5e6ad5-coronavirus-mask-shopping-supermarket-shutter.jpg',
  'https://images.unsplash.com/photo-1581622558667-3419a8dc5f83?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8ZGlzaGVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
  'https://images.unsplash.com/photo-1574629810360-7efbbe195018?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c29jY2VyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
  'https://images.unsplash.com/photo-1528712306091-ed0763094c98?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1280&q=80'
]

profile_pic = [
  "https://avatars.githubusercontent.com/u/33692745?s=400&u=84c4e3aea3d49f4eabf46376a19718d462834914&v=4",
  "https://avatars.githubusercontent.com/u/74359151?s=460&u=057bebafa3739a16372a24bb76925be189a97186&v=4",
  "https://avatars.githubusercontent.com/u/67854900?s=400&u=70c9e42d5250ddf918522d068dcd0485816d194e&v=4",
  "https://avatars.githubusercontent.com/u/18280640?s=400&u=4f2ccaabf2e6d5d8e8c029cd23b5098291851f1d&v=4"
]

title_array = [
  'School',
  'Park',
  'Groceries',
  'Dishes',
  'Football',
  'Cooking'
]

detail_array = [
  'Have a wonderful day at school',
  'play with your friends at the park',
  'go hopping with mummy',
  'do the dishes. Remember to put the plates in the drying rack',
  'play football. Get ready to kick the ball around',
  'cook pasta with daddy'
]
puts 'Cleaning up db...'
Review.destroy_all
puts 'All reviews deleted'
Item.destroy_all
puts 'All items deleted'
User.destroy_all
puts 'All users deleted.'


puts 'Creating users...'
user_email_list = ['s_pinchen@hotmail.com', 'ivanwilf@hotmail.com', 'natasha030320@gmail.com', 'hhknight@me.com']
user_list = []

user_email_list.length.times do |index|
  user = User.create!(email: user_email_list[index], password: "password", name: Faker::Name.name, birthday: Date.new(rand(2011..2015), rand(1..12), rand(1..28)), username: user_email_list[index].match(/(\S+)(@)(\S+)/)[1], url: profile_pic[index])
  user_list << user
  puts "User #{user.id}: #{user.email} was created!"
  image_array.each_with_index do |image, index|
    if image == image_array[0]
      # if its school only create the item in weekdays
      item = Item.new(title: title_array[index], start_date: DateTime.new(2021, 3, rand(8..12), rand(1..23),rand(0..59)), end_date: DateTime.new(2021, 3, rand(8..14)), category: "task,", details: detail_array[index])
    else
      item = Item.new(title: title_array[index], start_date: DateTime.new(2021, 3, rand(8..14), rand(1..23),rand(0..59)), end_date: DateTime.new(2021, 3, rand(8..14)), category: "task,", details: detail_array[index])
    end
    item.user = user
    file = URI.open(image)
    item.photo.attach(io: file, filename: 'first.png', content_type: 'image/png')
    item.save!
    puts "Task for #{user.name} created"

  end
end

# Test to make Herny a parent
User.first.parent = User.last
