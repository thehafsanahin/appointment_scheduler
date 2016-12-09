class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @time_slots = @user.time_slots

    @available_dates = @user.available_dates(7)
    @available_times_for_dates = @user.available_times_for_dates
    # raise @user.booked_time_slots.inspect
    # raise @available_times_for_dates.inspect
  end

  def dashboard
    if current_user.type == 'Patient'
      redirect_to patients_dashboard_path
    else
      redirect_to doctors_dashboard_path
    end
  end
end
