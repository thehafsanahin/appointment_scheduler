class AddDetailsToKnownProblem < ActiveRecord::Migration
  def change
    add_column :known_problems, :details, :string
  end
end
