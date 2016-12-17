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

  def status_with_icon(appointment)
    status = appointment.status

    if appointment.initiated?
      "Pending <i class='glyphicon glyphicon-question-sign'></i>".html_safe
    elsif appointment.accepted?
      "#{status.capitalize} <i class='glyphicon glyphicon-ok-circle'></i>".html_safe
    elsif appointment.rejected?
      "#{status.capitalize} <i class='glyphicon glyphicon-remove-sign'></i>".html_safe
    elsif appointment.completed?
      "#{status.capitalize} <i class='glyphicon glyphicon-ok-sign'></i>".html_safe
    elsif appointment.cancelled?
      "#{status.capitalize} <i class='glyphicon glyphicon-exclamation-sign'></i>".html_safe
    else
      "#{status.capitalize}".html_safe
    end

  end
end