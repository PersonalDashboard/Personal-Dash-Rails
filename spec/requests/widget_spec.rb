require 'rails_helper'

RSpec.describe "Widget", type: :request do
  let(:dashboard) { FactoryGirl.create(:dashboard) }
  let(:weather_widget) { Widget.find_by_name("Weather") }
  before(:each) { sign_in dashboard.user }

  describe 'adding a widget' do
    it 'creates when checkbox is checked', js: true do
      visit widgets_path
      check 'Weather'
      expect(WidgetDatum.last.widget).to eq(weather_widget)
    end
  end

  describe 'removing a widget' do
    it 'destroys when checkbox is unchecked', js: true do
      data = WidgetDatum.create(user: dashboard.user, widget: weather_widget)
      visit widgets_path
      uncheck 'Weather'
      expect(WidgetDatum.find_by_id(data.id)).to eq(nil)
    end
  end
end
