class Pet < ActiveRecord::Base
  enum pet_type: { dog: 0, cat: 1 }
  enum pet_status: { available: 0, selected: 1, adopted: 2 }

  has_many :selected_pets

  validates :name,
            presence:true

  validates :picture, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'format must be GIF, JPG or PNG'
  }

  validates :description,
            length: { in: 10..40 }

  before_destroy :ensure_not_selected

  # Updates a pets status, changes it to selected
  def select_pet
    self.update(pet_status: 1)
  end

  def deselect_pet
    self.update(pet_status: 0)
  end

  def adopt_pet
    self.update(pet_status: 2)
  end

  def Pet.get_available_pets
    Pet.order("pet_type DESC").available
  end

  def Pet.get_selected_pets
    Pet.order("pet_type DESC").selected
  end

  private

  def ensure_not_selected
    if selected_pets.empty?
      return true
    else
      errors.add(:base, 'Pet has already been selected')
      return false
    end
  end
end
