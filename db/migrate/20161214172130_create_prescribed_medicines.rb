class CreatePrescribedMedicines < ActiveRecord::Migration
  def change
    create_table :prescribed_medicines do |t|
      t.string :name
      t.string :strength
      t.string :dosage
      t.string :duration
      t.text :note
      t.references :prescription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
