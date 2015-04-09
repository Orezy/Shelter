json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :age, :description
  json.url pet_url(pet, format: :json)
end
