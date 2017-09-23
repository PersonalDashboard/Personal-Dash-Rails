require 'rails_helper'

describe DashboardsController do
  let(:dashboard) { FactoryGirl.create(:dashboard) }
  before(:each) { sign_in dashboard.user }

  describe "index" do
    it "should redirect to show" do
      get :index
      expect(response).to redirect_to(dashboard_path(dashboard))
    end
  end

  describe "show" do
    it "should set needed data variables" do
      get :show, params: {id: dashboard.to_param}
      expect(assigns(:dashboard)).to eq(dashboard)
      expect(assigns(:widgets).length).to eq(WidgetDatum.where(user_id: dashboard.user.id).length)
      expect(assigns(:data).length).to eq(assigns(:widgets).length)
      expect(assigns(:templates)).to have_key("templates")
    end
  end
end
