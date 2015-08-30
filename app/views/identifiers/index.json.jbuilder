json.array!(@identifiers) do |identifier|
  json.extract! identifier, :id, :person_id, :code
  json.url identifier_url(identifier, format: :json)
end
