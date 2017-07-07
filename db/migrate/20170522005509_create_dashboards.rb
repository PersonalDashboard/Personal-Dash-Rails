class CreateDashboards < ActiveRecord::Migration[5.1]
  def change
    create_table :dashboards do |t|
      t.references :user, foreign_key: true

      t.string :origin_address
      t.string :destination_address
      t.string :weather_api_key
      t.string :google_api_key
      t.timestamps
    end
  end
end
