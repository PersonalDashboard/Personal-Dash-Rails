class RemoveAddressesFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :home_city
    remove_column :users, :home_address
    remove_column :users, :home_state
    remove_column :users, :work_city
    remove_column :users, :work_address
    remove_column :users, :work_state
  end
end
