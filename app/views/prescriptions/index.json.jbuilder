json.array!(@prescriptions) do |prescription|
  json.extract! prescription, :id
  json.url prescription_url(prescription, format: :json)
end
