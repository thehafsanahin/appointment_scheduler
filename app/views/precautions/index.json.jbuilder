json.array!(@precautions) do |precaution|
  json.extract! precaution, :id, :name, :details
  json.url precaution_url(precaution, format: :json)
end
