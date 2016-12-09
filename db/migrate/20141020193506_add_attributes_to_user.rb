class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sex, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :contact_no, :string
    add_column :users, :address, :text
  end
end
