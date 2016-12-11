class DoctorsController < ApplicationController
  def dashboard
    @initiated_appointments = current_user.appointments.initiated
  end

  def show
  end

  def appointments
    @appointments = current_user.appointments.accepted
  end
end
