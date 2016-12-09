class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|

      t.timestamps
    end
  end
end
