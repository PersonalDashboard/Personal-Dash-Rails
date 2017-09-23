require 'rails_helper'

RSpec.describe WidgetsController, type: :controller do
  describe 'index' do
    let(:user) { FactoryGirl.create(:user) }

    it 'has expected instance variables' do
      sign_in user
      get :index
      expect(assigns(:widgets)).to eq(Widget.all)
      expect(assigns(:user_widget_data)).to eq(WidgetDatum.where(user_id: user.id))
      expect(assigns(:user_widgets).length).to eq(assigns(:user_widget_data).length)
    end
  end
end
