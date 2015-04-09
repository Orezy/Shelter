class SelectedPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :cart

  after_save :make_pet_unavailable
  after_destroy :make_pet_available

  private 
	  def make_pet_unavailable
		pet = Pet.find(self.pet_id)
	    pet.set_selected
	  end

	  def make_pet_available
		pet = Pet.find(self.pet_id)
		if (pet.status != "Adopted")
		    pet.set_available
		end
	  end
end
