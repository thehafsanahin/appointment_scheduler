class CreateKnownProblems < ActiveRecord::Migration
  def change
    create_table :known_problems do |t|

      t.timestamps
    end
  end
end
