# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 

puts "destroy all"
Host.destroy_all
Participant.destroy_all
Song.destroy_all
PowerHour.destroy_all
User.destroy_all

puts 'create testing account'
alex = User.create(name: 'Alex', email: 'alex@test.com', password: '1234')

puts 'create fake users'
puts 'fake user 1'
fake1 = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '5678'
)
puts 'fake user 2'
fake2 = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '5678'
)
puts 'fake user 3'
fake3 = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '5678'
)

puts 'create fake power hours'
puts 'fake power hour 1'
ph1 = PowerHour.create(
    title: 'fake power hour 1',
    description: Faker::Hipster.sentence,
    cover_image: 'https://www.thebeatles.com/sites/default/files/styles/responsive_thumbnail_mobile/public/2021-06/Magical-Mystery-Tour.jpg?itok=8midCi2f'
    date_time: Faker::Date.between(from: '2022-08-01', to: '2022-08-31')
)
puts 'fake power hour 2'
ph2 = PowerHour.create(
    title: 'fake power hour 2',
    description: Faker::Hipster.sentence,
    cover_image: 'https://upload.wikimedia.org/wikipedia/en/4/42/Beatles_-_Abbey_Road.jpg'
    date_time: Faker::Date.between(from: '2022-08-01', to: '2022-08-31')
)
puts 'fake power hour 3'
ph3 = PowerHour.create(
    title: 'fake power hour 3',
    description: Faker::Hipster.sentence,
    cover_image: 'https://www.cleveland.com/resizer/QXH4tEN4nFdZgqSSPz0nPIyuk7k=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/2CJOQE4IK5AY5OD33OHU5WOIIU.jpg'
    date_time: Faker::Date.between(from: '2022-08-01', to: '2022-08-31')
)

puts 'Create hosts'
h1 = Host.create(
    user_id: alex.id,
    power_hour: ph1.id
)
h2 = Host.create(
    user_id: fake1.id
    power_hour: ph2.id
)
h3 = Host.create(
    user_id: fake2.id,
    power_hour: ph3.id
)

puts 'Create participants for power hours'
puts 'power hour 1'
php1 = Participant.create(
    user_id: alex.id,
    power_hour: ph1.id
)


0