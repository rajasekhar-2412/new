json.array!(@customs) do |custom|
  json.extract! custom, :user_id, :fields
  json.url custom_url(custom, format: :json)
end
