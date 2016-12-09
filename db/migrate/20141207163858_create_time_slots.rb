class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.integer :patient_count, default: 1
      t.integer :duration

      t.timestamps
    end
  end
end
