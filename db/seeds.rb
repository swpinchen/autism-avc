# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_array = [
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429687/sunshine_aquarium_fksllm.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429686/cold_stone_icecream_afiuzg.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429686/toys_at_home_jgywxo.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429686/ueno_zoo_cgnxgd.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429687/picnic_at_park_oz7dye.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429687/us_kids_indoor_playhouse_muefco.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429687/walking_in_the_park_isuns6.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429686/outdoor_swimming_pool_wi0j2g.jpg',
  'https://res.cloudinary.com/dbhwvijtx/image/upload/v1615429686/toys_r_us_toyshop_lu8cs9.jpg'
]

profile_pic = [
  "https://avatars.githubusercontent.com/u/33692745?s=400&u=84c4e3aea3d49f4eabf46376a19718d462834914&v=4",
  "https://avatars.githubusercontent.com/u/74359151?s=460&u=057bebafa3739a16372a24bb76925be189a97186&v=4",
  "https://avatars.githubusercontent.com/u/67854900?s=400&u=70c9e42d5250ddf918522d068dcd0485816d194e&v=4",
  "https://avatars.githubusercontent.com/u/18280640?s=400&u=4f2ccaabf2e6d5d8e8c029cd23b5098291851f1d&v=4"
]

title_array = [
  'Aquarium',
  'Icecream',
  'Toys',
  'Zoo',
  'Picnic',
  'Indoor play park',
  'Park',
  'Swimming pool',
  'Toy shop'
]

detail_array = [
  'visit the aquarium',
  'get icecream with daddy',
  'play with toys at home',
  'visit the zoo with mummy',
  'go to the park and have a picnic',
  'play at the indoor play park',
  'go for a stroll at the park',
  'have a swim in the pool',
  'visit the toy shop'
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
