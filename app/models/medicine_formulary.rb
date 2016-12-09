class MedicineFormulary < ActiveRecord::Base

  belongs_to :side_effect
  accepts_nested_attributes_for :side_effect
end
