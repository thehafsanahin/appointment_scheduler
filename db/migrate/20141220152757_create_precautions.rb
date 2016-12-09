class CreatePrecautions < ActiveRecord::Migration
  def change
    create_table :precautions do |t|
      t.string :name
      t.string :details

      t.timestamps
    end
  end
end
