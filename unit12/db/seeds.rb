# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pet.create(name: "Bob", age: "4", description: "A brown and white cat", pet_type: 0, PET_STATUS: "Available", picture: "cat2.jpg")
Pet.create(name: "Joe", age: "7", description: "A mellow and friendly dog", pet_type: 1, PET_STATUS: "Available", picture: "dog1.jpg")
Pet.create(name: "Pandar", age: "10", description: "The cutest panda ever", pet_type: 2, PET_STATUS: "Available", picture: "panda1.jpg")
Pet.create(name: "Anne", age: "6", description: "A mischevious hedgehog", PET_STATUS: "Available", picture: "hedgehog1.jpg")
Pet.create(name: "Babu", age: "2", description: "Wish this was my cat", pet_type: 0, PET_STATUS: "Available", picture: "cat1.jpg")
Pet.create(name: "Velvet", age: "11", description: "An older dog", pet_type: 1, PET_STATUS: "Available", picture: "dog2.jpg")
