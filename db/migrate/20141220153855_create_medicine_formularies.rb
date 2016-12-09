class CreateMedicineFormularies < ActiveRecord::Migration
  def change
    create_table :medicine_formularies do |t|
      t.string :name
      t.string :brand_name
      t.string :price
      t.string :uses

      t.timestamps
    end
  end
end
