require 'rails_helper'

RSpec.describe WidgetDatum, type: :model do
  describe 'user_widgets' do
    it 'returns widget data belonging to the given user' do
      user = FactoryGirl.create(:user)
      weather_widget = Widget.find_by_name("Weather")
      widget_datum = WidgetDatum.create(user: user, widget: weather_widget)
      expect(WidgetDatum.user_widgets(user)).to include(widget_datum)
    end
  end
end
