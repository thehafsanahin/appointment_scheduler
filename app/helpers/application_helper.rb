module ApplicationHelper

  def age(dob)
    today = Date.today
    age = today.year - dob.year
    age -= 1 if dob.strftime("%m%d").to_i > today.strftime("%m%d").to_i
    age
  end

  def patients_records(patient_id)
    patient = Patient.find(patient_id)
    patients_records_path(patient)
  end

  def humanize_date(date)
    date.strftime("%B %d, %Y")
  end
end