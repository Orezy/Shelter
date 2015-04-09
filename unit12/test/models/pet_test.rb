require 'test_helper'

class PetTest < ActiveSupport::TestCase

  # Test an empty pet and test for no name
  test "pet attributes must not be empty" do
  	pet = Pet.new
  	assert pet.invalid? # Test for empty pet
  	assert pet.errors[:name].any? # Test for no name
  end

  # test description of length 9
  test "description of length 9 is invalid" do
  	assert !Pet.new(name: pets(:desc_length_9).name, age: pets(:desc_length_9).age, description: pets(:desc_length_9).description).valid?, 'Fixture with description of length 9 returned valid - should have returned invalid.'
  end

  # test description of length 41
  test "description of length 41 is invalid" do
  	assert !Pet.new(name: pets(:desc_length_41).name, age: pets(:desc_length_41).age, description: pets(:desc_length_41).description).valid?, 'Fixture with description of length 41 returned valid - should have returned invalid.'
  end

  # test description of length 10
  test "description of length 10 is valid" do
  	assert Pet.new(name: pets(:desc_length_10).name, age: pets(:desc_length_10).age, description: pets(:desc_length_10).description).valid?, 'Fixture with description of length 10 returned invalid - should have returned valid.'
  end

  # test description of length 40
  test "description of length 40 is valid" do
  	assert Pet.new(name: pets(:desc_length_40).name, age: pets(:desc_length_40).age, description: pets(:desc_length_40).description).valid?, 'Fixture with description of length 40 returned invalid - should have returned valid.'
  end

end
