module PrescriptionsHelper
  def doctor_summary(appointment)
    "<h3>Doctor #{appointment.doctor.full_name}</h3>" +
        "<h4>#{appointment.doctor.profile.education}</h4>" +
        "<h4>#{appointment.doctor.profile.specialty}</h4>" +
        "<h4>#{appointment.doctor.profile.clinic_address}</h4>"
  end

  def patient_summary(appointment)
    "<h4>Patient Name: #{appointment.patient.full_name}</h4>" +
        "<h4>Age: #{age(appointment.patient.date_of_birth)}</h4>"
  end
end
