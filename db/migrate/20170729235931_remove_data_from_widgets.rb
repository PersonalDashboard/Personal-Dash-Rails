class RemoveDataFromWidgets < ActiveRecord::Migration[5.1]
  def change
    remove_column :widgets, :data
  end
end
