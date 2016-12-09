class AddProblemToKnownProblem < ActiveRecord::Migration
  def change
    add_reference :known_problems, :problem, index: true
  end
end
