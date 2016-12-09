json.array!(@time_slots) do |time_slot|
  json.extract! time_slot, :id, :day, :start_time, :end_time, :patient_count, :duration
  json.url time_slot_url(time_slot, format: :json)
end
