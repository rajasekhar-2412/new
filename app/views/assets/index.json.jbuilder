json.array!(@assets) do |asset|
  json.extract! asset, :asset_type, :asset_id, :properties
  json.url asset_url(asset, format: :json)
end
