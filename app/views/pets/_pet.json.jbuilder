json.extract! pet, :id, :name, :breed, :sex, :age, :slug, :created_at, :updated_at
json.url pet_url(pet, format: :json)