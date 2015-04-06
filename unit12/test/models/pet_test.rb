require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

#Tests to make sure an empty pet cannot be saved
  test "pet is not empty" do
  	assert !Pet.new.valid?, "Empty pet should not be saved"
  end

#Test to make sure a pet cannot be saved with no name
  test "pet has no name" do
  	assert !Pet.new(name: pets(:noname).name, age: pets(:noname).age, description: pets(:noname).description).valid?, "Pet must contain a name"
  end 

#Test to make sure a pet cannot be created with a description length of 9
  test "pet has description length of 9" do
  	assert !Pet.new(name: pets(:nine).name, age: pets(:nine).age, description: pets(:nine).description).valid?, "Pet description length of 9 should not be valid"
  end

#Test to make sure a pet can be created with a description length of 10
 test "pet has description length of 10" do
  	assert Pet.new(name: pets(:ten).name, age: pets(:ten).age, description: pets(:ten).description).valid?, "Pet description length of 10 should be valid"
  end

#Test to make sure a pet can be created with a description length of 40
 test "pet has description length of 40" do
  	assert Pet.new(name: pets(:forty).name, age: pets(:forty).age, description: pets(:forty).description).valid?, "Pet description length of 40 should be valid"
  end

#Test to make sure a pet cannot be created with a description length of 41
 test "pet has description length of 41" do
  	assert !Pet.new(name: pets(:fortyone).name, age: pets(:fortyone).age, description: pets(:fortyone).description).valid?, "Pet description length of 41 should not be valid"
  end
end