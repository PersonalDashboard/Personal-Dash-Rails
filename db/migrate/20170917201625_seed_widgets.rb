class SeedWidgets < ActiveRecord::Migration[5.1]
  Widget.seed_widgets if Rails.env.production?
end
