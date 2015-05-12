json.array!(@libraries) do |library|
  json.extract! library, :code, :name
  json.url library_url(library, format: :json)
end
