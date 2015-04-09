# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Pet.create(name: 'Polly', age: '15', description: 'The beautiful red, green, & yellow bird.', pet_type: 5, status: "Available", picture: "parrot.jpg")
Pet.create(name: 'Frisky', age: '8', description: 'Calico with a white patch on the nose.', pet_type: 1, status: "Available", picture: "cat.jpg")
Pet.create(name: 'Rex', age: '4', description: 'Energetic and playful.', pet_type: 2, status: "Available", picture: "dog1.jpg")
Pet.create(name: 'Gerbie', age: '2', description: 'A twitchy nose and a plump behind.', pet_type: 4, status: "Available", picture: "gerbil.jpg")
Pet.create(name: 'Dory', age: '1', description: 'All she ever says is GLUB GLUB', pet_type: 6, status: "Available", picture: "dory.png")
Pet.create(name: 'Fido', age: '7', description: 'He is barking mad!', pet_type: 2, status: "Available", picture: "dog2.jpg")