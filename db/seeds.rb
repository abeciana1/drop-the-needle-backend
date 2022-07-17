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
# alex = User.create(name: 'Alex', email: 'alex@test.com', password: '1234')

0