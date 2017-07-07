class AddLocationsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :home_city, :string
    add_column :users, :home_address, :string
    add_column :users, :work_city, :string
    add_column :users, :work_address, :string
  end
end
