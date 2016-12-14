json.extract! prescribed_medicine, :id, :name, :strength, :dosage, :duration, :note, :prescription_id, :created_at, :updated_at
json.url prescribed_medicine_url(prescribed_medicine, format: :json)