class DoctorsController < ApplicationController
  def dashboard
    @initiated_appointments = current_user.appointments.initiated
    @todays_appointments = current_user.appointments.todays
    @connected_patients = current_user.connected_patients
  end

  def show
  end

  def appointments
    @appointments = current_user.appointments.accepted
  end
end
