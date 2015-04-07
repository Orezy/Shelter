class ShelterController < ApplicationController
  include CurrentCart
  before_action :set_cart

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.get_available_pets
  end

  def agreement
    @pets = Pet.get_selected_pets
  end

  def adopt
    if @cart.id == session[:cart_id]
      @cart.selected_pets.each do |selected_pet|
        selected_pet.pet.adopt_pet
        selected_pet.destroy
      end
      @cart.destroy
      session[:cart_id] = nil
      respond_to do |format|
        format.html { redirect_to shelter_index_path }#, notice: 'Cart was successfully emptied.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :age, :description, :pet_type)
    end
end

