class ShelterController < ApplicationController
	include CurrentCart
	before_action :set_cart
  def index
  	@pets = Pet.get_available_pets
  end

  def adopt
  	@adopting = true
  	@pets = @cart.selected_pets
  end

  def finish
  	@selected_pets  = @cart.selected_pets

  	@selected_pets.each do |spet|
  		spet.pet.updateStatus("Adopted") 
  	end

  	 @cart.destroy
  	 respond_to do  |format|
  	 	format.html { redirect_to shelter_index_path }
  	 end
  	end
end