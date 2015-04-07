# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pet_list = [
  ["Jean","9","An older dog, well trained", "dog1.jpg"],
  ["Pup","1","A cute little puppy", "dog2.jpg"],
  ["Jody","4","This lady is looking for a home", "dog3.jpg"],
  ["Sweetie","8","For those who want someone to cuddle", "dog4.jpg"],
  ["Robbie","4","He's a playful bundle of joy", "dog5.jpg"],
  ["Joe","11","The oldest and wisest of the dogs", "dog6.jpg"]
]

pet_list.each do |name, age, description, picture|
  Pet.create(name: name, age: age, description: description, picture: picture)
end
