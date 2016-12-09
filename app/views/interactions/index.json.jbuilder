json.array!(@interactions) do |interaction|
  json.extract! interaction, :id
  json.url interaction_url(interaction, format: :json)
end
