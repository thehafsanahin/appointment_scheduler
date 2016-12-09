class AddDoctorToDoctorProfiles < ActiveRecord::Migration
  def change
    add_reference :doctor_profiles, :doctor, index: true
  end
end
