class ShelterController < ApplicationController
  include CurrentCart

  # GET /shelter
  def index
    @pets = Pet.get_available_pets
    set_cart
  end

  def adopt
  	@pets = Pet.get_selected_pets
  	set_cart
  	@adopting = true
  end

  def finish
  	@pets = Pet.get_selected_pets
  	@pets.each do |p|
  		p.set_adopted
  	end

  	set_cart

  	@cart.destroy
  	respond_to do |format|
  		format.html {redirect_to shelter_index_path}
  	end
	# redirect_to cart_delete_path



  end
end
