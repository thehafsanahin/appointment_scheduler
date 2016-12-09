class AddPatientToKnownProblem < ActiveRecord::Migration
  def change
    add_reference :known_problems, :patient, index: true
  end
end
