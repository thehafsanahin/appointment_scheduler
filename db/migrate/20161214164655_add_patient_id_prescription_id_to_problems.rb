class AddPatientIdPrescriptionIdToProblems < ActiveRecord::Migration
  def change
    add_reference :problems, :patient, index: true
    add_reference :problems, :prescription, index: true
  end
end
