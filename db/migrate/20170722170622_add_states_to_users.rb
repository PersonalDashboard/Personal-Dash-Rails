class AddStatesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :home_state, :string
    add_column :users, :work_state, :string
  end
end
