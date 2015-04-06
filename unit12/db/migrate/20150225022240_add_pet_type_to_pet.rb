class AddPetTypeToPet < ActiveRecord::Migration
  def change
    add_column :pets, :pet_type, :integer, default: 2
  end
end
