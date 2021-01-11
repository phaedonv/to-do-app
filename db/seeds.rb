# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all

puts "hello friend"

puts "creating tasks"

p task1 = Task.new(
  title: "shopping",
  details: "do the shopping",
  completed: false
  )
task1.save

p task2 = Task.create!(
  title: "catwalk",
  details: "walk the cat to the park",
  completed: true
  )
task2.save

puts "Goodbye friend"
