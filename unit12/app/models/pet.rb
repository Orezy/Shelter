class Pet < ActiveRecord::Base
	before_destroy :ensure_not_selected

	validates :name, presence: true
	validates :description, length: { in: 10..40}
	validates :picture, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'format must be GIF, JPG, or PNG'
	}
	has_many :selected_pets

	enum pet_type: [ :cat, :dog, :panda, :hedgehog ]
	PET_STATUS = ["Adopted", "Available", "Selected"]

	def ensure_not_selected
		if selected_pets.empty?
			return true
		else
			errors.add(:base, 'Pet has already been selected')
			return false
		end
	end

	def updateStatus(stat)
		self.update(PET_STATUS: stat)
	end

	def Pet.get_available_pets
		return Pet.all.where("PET_STATUS = ?", "Available").order(:pet_type)
	end
end
