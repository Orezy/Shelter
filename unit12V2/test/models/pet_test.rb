require 'test_helper'

class PetTest < ActiveSupport::TestCase

  test 'a pet with no attributes is not valid' do
    # Here we create a pet with no attributes
    pet = Pet.new
    # Then we test to make sure that the empty pet does not save
    assert_not pet.save, 'An empty pet has been saved.'
  end

  test 'a pet description can only be between 10 and 40 characters' do
    # Here we create four pets, badPet1 has a 9 character description
    badPet1 = Pet.new(name: pets(:tooShort).name, age: pets(:tooShort).age,
                      description: pets(:tooShort).description)
    # badPet2 has a 41 character description
    badPet2 = Pet.new(name: pets(:tooLong).name, age: pets(:tooLong).age,
                      description: pets(:tooLong).description)
    # goodPet1 has a 10 character description
    goodPet1 = Pet.new(name: pets(:lowerBound).name, age: pets(:lowerBound).age,
                      description: pets(:lowerBound).description)
    # goodPet2 has a 40 character description
    goodPet2 = Pet.new(name: pets(:upperBound).name, age: pets(:upperBound).age,
                      description: pets(:upperBound).description)
    # since the badPets are not within the bounds they should not be able to be saved, but the goodPets should be able to save
    assert_not badPet1.save, 'A pet with less than 10 characters in its description has been saved.'
    assert_not badPet2.save, 'A pet with more than 40 characters in its description has been saved.'
    assert goodPet1.save, 'A pet with exactly 10 characters in its description could not be saved.'
    assert goodPet2.save, 'A pet with exactly 40 characters in its description could not be saved.'
  end

  test 'a pet with no name attribute is invalid' do
    # A pet with no name attribute is initialized
    pet = Pet.new(name: pets(:noname).name, age: pets(:noname).age,
                  description: pets(:noname).description)
    # Then we try to save the pet, which should not work because the pet is invalid
    assert_not pet.save, 'A pet without a name attribute was saved.'
  end

end
