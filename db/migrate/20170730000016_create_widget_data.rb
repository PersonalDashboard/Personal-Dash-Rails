class CreateWidgetData < ActiveRecord::Migration[5.1]
  def change
    create_table :widget_data do |t|
      t.string :data
      t.integer :widget_id
      t.integer :user_id

      t.references :widget, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
