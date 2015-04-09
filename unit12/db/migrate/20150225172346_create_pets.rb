class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.string :description
      t.column :pet_type, :integer, default: 0, null: false

      t.timestamps null: false
    end
  end
end
