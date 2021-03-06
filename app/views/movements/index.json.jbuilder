json.array!(@movements) do |movement|
  json.extract! movement, :id, :person_id, :location_id, :notes
  json.url movement_url(movement, format: :json)
end
