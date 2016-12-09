class AddDoctorToTimeSlot < ActiveRecord::Migration
  def change
    add_reference :time_slots, :doctor, index: true
  end
end
