class CreateMedicalTests < ActiveRecord::Migration
  def change
    create_table :medical_tests do |t|
      t.string :name
      t.references :prescription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
