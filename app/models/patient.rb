class Patient < User

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_many :known_problems
  has_many :problems, through: :known_problems
end
