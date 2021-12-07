# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
first_user = User.first
first_car = Car.new(user: first_user, name: "jafsl", description: "ddfadgasdgag", year: 1960, model: "S", location: "Shanghai")
first_car.save!
