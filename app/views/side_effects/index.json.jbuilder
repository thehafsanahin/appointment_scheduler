json.array!(@side_effects) do |side_effect|
  json.extract! side_effect, :id, :name, :description
  json.url side_effect_url(side_effect, format: :json)
end
