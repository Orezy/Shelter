class Pet < ActiveRecord::Base
	enum pet_type: [ :unknown, :cat, :dog, :turtle, :gerbil, :parrot, :fish ]
	validates :name,
				presence: true
	validates :description,
				length: { in: 10..40 }
	validates :picture, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'format must be GIF, JPG or PNG'
  	}
	has_many :selected_pet
	before_destroy :ensure_not_selected

	def set_selected
		self.update(status: "Selected")
	end

	def set_available
		self.update(status: "Available")
	end

	def set_adopted
		self.update(status: "Adopted")
	end

	def Pet.get_available_pets
		@pets = Pet.all.order(:pet_type).where(status: 'Available')
	end

	def Pet.get_selected_pets
		@pets = Pet.all.order(:pet_type).where(status: 'Selected')
	end

	def Pet.any_pets_selected
		sel_pets = Pet.all.order(:pet_type).where(status: 'Selected')
		if sel_pets.length > 0
			return true
		else
			return false
		end
	end

	private

		def ensure_not_selected
			if selected_pet.empty?
				return true
			else
				errors.add(:base, 'Pet has already been selected')
				return false
			end
		end
end
