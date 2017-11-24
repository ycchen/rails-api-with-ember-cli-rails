# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
PublishingHouse.delete_all
Book.delete_all
Author.delete_all

(1..100).each do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email
    )
end

pub1 = PublishingHouse.create(name: "ABC Publisher", discount: 40)
pub2 = PublishingHouse.create(name: "Acme Publishing House", discount: 50)
pub3 = PublishingHouse.create(name: "Foobar Corporation", discount: 55)
pubs=[pub1, pub2, pub3]

b= binding
authors = []
(1..10).each do |i|
  b.local_variable_set("author#{i}" , Author.create(name: Faker::Book.author) )
  authors.push(b.local_variable_get("author#{i}"))
end

puts b.local_variables.class
puts b.local_variable_get(b.local_variables.sample).inspect

# (1..10).each do |i|
#   puts b.local_variable_get("author#{i}").inspect
# end

(1..20).each do |i|
  Book.create!(title: Faker::Book.title,
    author: authors.sample,
    publisher: pubs.sample,
    price: rand(11.20...30.50).round(2))
end
