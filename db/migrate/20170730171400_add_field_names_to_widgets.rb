class AddFieldNamesToWidgets < ActiveRecord::Migration[5.1]
  def change
    add_column :widgets, :field_names, :string
  end
end
