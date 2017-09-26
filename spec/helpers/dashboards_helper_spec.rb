require 'rails_helper'

RSpec.describe DashboardsHelper, type: :helper do

  let(:weather_widget) { Widget.find_by_name("Weather") }
  let(:traffic_widget) { Widget.find_by_name("Traffic") }
  before(:each) { assign(:templates, YAML.load_file("#{Rails.root}/config/widget_templates.yml")) }
  before(:each) do
    assign(:templates, YAML.load_file("#{Rails.root}/config/widget_templates.yml"))
    assign(:data, {weather: {temp: "things", icon: "things"},  news: {articles: "things" }})
  end

  describe 'standard_template' do
    context 'template exists' do
      it 'returns the template' do
        expect(helper.standard_template(weather_widget)).to be_a(Hash)
      end
    end

    context 'no template exists' do
      it 'returns nothing' do
        new_widget = Widget.create(name: "New")
        expect(helper.standard_template(new_widget)).to eq(nil)
      end
    end
  end

  describe 'template_for' do
    it 'returns html template for the widget' do
      template = helper.template_for(weather_widget)
      expect(template).to include('div')
      expect(template).to include("id='temp'")
      expect(template).to include("id='time'")
      expect(template).to include("class='weather-icon '")
    end
  end

  describe 'map_template' do
    context 'map template exists' do
      it 'returns the template' do
        expect(helper.map_template(traffic_widget)).to be_a(Hash)
      end
    end

    context 'no map template exists' do
      it 'returns nothing' do
        expect(helper.map_template(weather_widget)).to eq(nil)
      end
    end
  end
end
