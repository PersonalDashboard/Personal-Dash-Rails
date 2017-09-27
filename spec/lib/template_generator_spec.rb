require 'rails_helper'
require_relative '../../lib/template_generator'

RSpec.describe TemplateGenerator, type: :lib do
  let(:weather_widget) { Widget.find_by_name("Weather") }
  let(:traffic_widget) { Widget.find_by_name("Traffic") }
  let(:templates) { YAML.load_file("#{Rails.root}/config/widget_templates.yml") }
  let(:data) { {weather: {temp: "foobar"}}.stringify_keys }
  let(:template_generator) { TemplateGenerator.new(templates, data) }

  describe 'template_for' do
    context 'template is map' do
      it 'returns map template' do
        expect(template_generator.template_for(traffic_widget, true)).to include("<iframe")
      end
    end

    context 'template is standard' do
      it 'returns standard template' do
        expect(template_generator.template_for(weather_widget)).to include("col-md-3")
      end
    end
  end

  describe 'map_template' do
    context 'template exists for widget' do
      it 'returns the template' do
        expect(template_generator.map_template(traffic_widget)).to be_a(Hash)
      end
    end

    context 'template does not exist' do
      it 'returns nothing' do
        fake_widget = Widget.create(name: "foobar", field_names: "one,two")
        expect(template_generator.map_template(fake_widget)).to eq(nil)
      end
    end

    context 'is not a map widget' do
      it 'returns nothing' do
        expect(template_generator.map_template(weather_widget)).to eq(nil)
      end
    end
  end

  describe 'standard_template' do
    context 'template exists for widget' do
      it 'returns the template' do
        expect(template_generator.standard_template(weather_widget)).to be_a(Hash)
      end
    end

    context 'template does not exist' do
      it 'returns nothing' do
        fake_widget = Widget.create(name: "foobar", field_names: "one,two")
        expect(template_generator.standard_template(fake_widget)).to eq(nil)
      end
    end
  end
end
