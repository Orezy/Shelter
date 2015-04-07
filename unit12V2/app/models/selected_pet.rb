class SelectedPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :cart

  after_save :make_pet_unavailable
  before_destroy :make_pet_available

  private

  def make_pet_unavailable
    self.pet.select_pet
  end

  def make_pet_available
    self.pet.deselect_pet
  end
end
