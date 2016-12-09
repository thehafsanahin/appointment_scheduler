class TimeSlot < ActiveRecord::Base

  belongs_to :doctor
  before_save :remove_similar_record, :set_duration

  def remove_similar_record
    obj = TimeSlot.where(day: self.day)
    obj.delete_all
  end

  def set_duration
    self.duration = ((self.end_time.to_i - self.start_time.to_i) / self.patient_count)
  end

  def self.humanize_time(t)
    Time.at(t.to_i).strftime('%I:%M %P')
  end
end
