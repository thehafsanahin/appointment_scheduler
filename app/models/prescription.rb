class Prescription < ActiveRecord::Base
  has_many :problems, dependent: :destroy
  has_many :prescribed_medicines, dependent: :destroy
  has_many :medical_tests, dependent: :destroy

  belongs_to :appointment

  accepts_nested_attributes_for :problems
  accepts_nested_attributes_for :prescribed_medicines
  accepts_nested_attributes_for :medical_tests
end
