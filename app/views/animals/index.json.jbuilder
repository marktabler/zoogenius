json.array!(@animals) do |animal|
  json.extract! animal, :id, :name, :classification_type, :classification_id, :zoo_id
  json.url animal_url(animal, format: :json)
end
