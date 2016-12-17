class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  has_one :prescription
  has_many :problems, through: :prescription

  enum status: [:initiated, :accepted, :rejected, :completed, :cancelled]

  scope :upcoming, -> {self.accepted.where('date >= ?', Time.now)}
  scope :todays, -> {self.accepted.where(date: Date.today)}
end
