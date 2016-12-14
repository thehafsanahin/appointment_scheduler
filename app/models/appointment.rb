class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  enum status: [:initiated, :accepted, :rejected, :completed]

  scope :upcoming, -> {self.accepted.where('date >= ?', Time.now)}
end
