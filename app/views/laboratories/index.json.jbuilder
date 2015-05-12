json.array!(@laboratories) do |laboratory|
  json.extract! laboratory, :code, :name
  json.url laboratory_url(laboratory, format: :json)
end
