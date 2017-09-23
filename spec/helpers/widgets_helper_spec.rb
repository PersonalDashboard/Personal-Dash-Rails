require 'rails_helper'

RSpec.describe WidgetsHelper, type: :helper do
  describe 'widget_data_id' do
    let(:user) { FactoryGirl.create(:user) }
    let!(:weather_widget) { Widget.find_by_name("Weather") }
    let!(:widget_datum) { WidgetDatum.create(user_id: user.id, widget_id: weather_widget.id) }

    it 'should determine the widget_data id of a given widget' do
      assign(:user_widgets, Widget.where(name: "Weather"))
      assign(:user_widget_data, WidgetDatum.where(id: widget_datum.id))
      expect(helper.widget_data_id(weather_widget)).to eq(widget_datum.id)
    end
  end
end
