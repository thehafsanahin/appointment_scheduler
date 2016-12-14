class Patient < User
  has_many :doctors, through: :appointments
  has_many :problems, through: :appointments
  has_many :appointments, dependent: :destroy
  has_many :prescriptions, through: :appointments
end
