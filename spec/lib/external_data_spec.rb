require 'rails_helper'
require_relative '../../lib/external_data'

RSpec.describe ExternalData, type: :lib do

  let(:user) { FactoryGirl.create(:user) }
  let(:weather_widget) { Widget.find_by_name("Weather") }
  let(:news_widget) { Widget.find_by_name("News") }
  let(:how_to_widget) { Widget.find_by_name("How To") }
  let(:widget_datum) { WidgetDatum.new(user: user, widget: weather_widget) }
  let(:external_data) { ExternalData.new(user) }


  describe 'fahrenheit' do
    it 'converts celsius temperature to fahrenheit' do
      expect(external_data.fahrenheit(0)).to eq(32)
    end
  end

  describe 'weather_icon' do
    it 'returns a style' do
      expect(external_data.weather_icon(701)).to eq("wi wi-sprinkle")
    end
  end

  describe 'widget_api_data' do
    describe 'news_link' do
      it 'returns an anchor tag' do
        result = external_data.widget_api_data(news_widget)
        expect(result["articles"].first).to include("<a href=")
      end
    end

    describe 'how_to_link' do
      it 'returns an anchor tag' do
        result = external_data.widget_api_data(how_to_widget)
        expect(result["title"]).to include("<a href=")
      end
    end
  end
end
