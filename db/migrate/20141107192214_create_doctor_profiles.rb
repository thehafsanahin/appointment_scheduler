class CreateDoctorProfiles < ActiveRecord::Migration
  def change
    create_table :doctor_profiles do |t|
      t.string :education
      t.string :specialty
      t.string :experience
      t.string :practice_clinic_name
      t.string :clinic_address
      t.string :clinic_contact_no
      t.string :website
      t.string :consultation_fee
    end
  end
end
