class AddAppointmentIdToPrescriptions < ActiveRecord::Migration
  def change
    add_reference :prescriptions, :appointment, index: true
  end
end
