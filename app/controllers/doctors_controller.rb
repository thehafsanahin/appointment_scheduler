class DoctorsController < ApplicationController
  def dashboard
  end

  def show

  end

  def appointments
    @appointments = current_user.appointments
  end
end
