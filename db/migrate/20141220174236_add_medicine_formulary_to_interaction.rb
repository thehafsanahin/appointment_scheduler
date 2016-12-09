class AddMedicineFormularyToInteraction < ActiveRecord::Migration
  def change
    add_reference :interactions, :medicine_formulary, index: true
  end
end
