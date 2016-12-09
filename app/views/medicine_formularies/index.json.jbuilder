json.array!(@medicine_formularies) do |medicine_formulary|
  json.extract! medicine_formulary, :id, :name, :brand_name, :price, :uses
  json.url medicine_formulary_url(medicine_formulary, format: :json)
end
