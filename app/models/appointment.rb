class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  enum status: [:initiated, :accepted, :rejected, :completed]
end
