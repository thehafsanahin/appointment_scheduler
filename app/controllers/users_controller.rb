class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @time_slots = @user.time_slots

    @available_dates = @user.available_dates(7)
    @available_times_for_dates = @user.available_times_for_dates
  end

  def dashboard
    if current_user.type == 'Patient'
      redirect_to patients_dashboard_path
    else
      redirect_to doctors_dashboard_path
    end
  end
end
