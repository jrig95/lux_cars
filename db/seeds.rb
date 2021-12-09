# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Car.destroy_all

puts "Creating restaurants..."

first_user = User.first
first_car = Car.new(user: first_user, name: "Escalade", description: "A classic SUV popular in the mid 2000's ", year: 2003, model: "S", location: "Minhang")
first_car.save!

second_car = Car.new(user: first_user, name: "Ferrari", description: "A classic italian sports car guaranteed to turn heads", year: 1999, model: "S", location: "Shanghai")
second_car.save!

puts "Done"
