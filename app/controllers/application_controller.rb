class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  helper_method :account_url
  before_action :authenticate_user!

  def account_url
    return new_user_session_path unless user_signed_in?
    case current_user.class.name
      when 'Patient'
        patients_dashboard_url
      when 'Doctor'
        doctors_dashboard_url
      else
        root_url
    end
  end

  def after_sign_in_path_for(resource)
    #stored_location_for(resource) || account_url
    account_url
  end
end
