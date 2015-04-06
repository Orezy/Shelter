class SelectedPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :cart

  after_save :make_pet_unavailable
  after_destroy :make_pet_available
  private

  	def make_pet_unavailable 
  		pet = Pet.find(self.pet_id)
  		pet.updateStatus("Selected")
  	end

  	def make_pet_available
  		pet = Pet.find(self.pet_id)
  		if (pet.PET_STATUS != "Adopted")
  			pet.updateStatus("Available")
  		end
  	end
end
