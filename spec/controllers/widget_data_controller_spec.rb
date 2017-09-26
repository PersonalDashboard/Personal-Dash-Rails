require 'rails_helper'

RSpec.describe WidgetDataController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let!(:weather_widget) { Widget.find_by_name("Weather") }
  let!(:widget_datum) { WidgetDatum.create(user: user, widget: weather_widget) }
  before(:each) { sign_in user }

  describe 'create' do
    it 'returns the widget data id in a JSON hash' do
      post :create, params: { user: user, widget: weather_widget }, format: :json
      expect(JSON.parse(response.body)).to eq({ widget_data: WidgetDatum.last.id }.stringify_keys)
    end
  end

  describe 'destroy' do
    it 'returns true when widget is destroyed' do
      expect { delete :destroy, params: {id: widget_datum.id}, format: :json }.to change(WidgetDatum, :count).by(-1)
      expect(JSON.parse(response.body)).to eq({ success: true }.stringify_keys)
    end
  end

  describe 'update' do
    context 'saves' do
      it 'updates data with field name values and redirects to widgets page' do
        put :update, params: {id: widget_datum.id, city: 'Jacksonville', state: 'FL'}
        expect(widget_datum.reload.data).to eq("Jacksonville,FL")
        expect(response).to redirect_to(widgets_path)
      end
    end

    context 'fails to save' do
      it 'redirects back' do
        allow_any_instance_of(WidgetDatum).to receive(:save).and_return(false)
        @request.env['HTTP_REFERER'] = root_path
        put :update, params: {id: widget_datum.id, city: 'Jacksonville', state: 'FL'}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
