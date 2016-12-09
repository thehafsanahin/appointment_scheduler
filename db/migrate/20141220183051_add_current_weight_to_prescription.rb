class AddCurrentWeightToPrescription < ActiveRecord::Migration
  def change
    add_column :prescriptions, :current_weight, :string
  end
end
