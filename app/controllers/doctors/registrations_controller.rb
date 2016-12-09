class Doctors::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters


  def create
    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        # sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :sex, :date_of_birth, :contact_no, :address,
               doctor_profile_attributes: [:id, :education, :specialty, :experience, :practice_clinic_name, :clinic_address, :clinic_contact_no])
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:password, :password_confirmation, :first_name, :last_name, :sex, :date_of_birth, :contact_no, :address,
               doctor_profile_attributes: [:id, :education, :specialty, :experience, :practice_clinic_name, :clinic_address, :clinic_contact_no])
    end
  end


end