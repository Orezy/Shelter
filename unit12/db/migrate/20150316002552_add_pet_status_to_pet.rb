class AddPetStatusToPet < ActiveRecord::Migration
  def change
    add_column :pets, :PET_STATUS, :string
  end
end
