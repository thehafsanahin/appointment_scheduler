class Prescription < ActiveRecord::Base
  has_many :problem
  accepts_nested_attributes_for :problem
end
