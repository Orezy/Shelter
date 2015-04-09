class Cart < ActiveRecord::Base
	has_many :selected_pet, dependent: :destroy
end
