require 'rails_helper'

describe DashboardsController do
  before(:each) do
    @dashboard = FactoryGirl.create(:dashboard)
    sign_in @dashboard.user
  end
  describe "index" do
    it "should redirect to show" do
      get :index
      expect(response).to redirect_to(dashboard_path(@dashboard))
    end
  end

  describe "show" do
    it "should set needed data variables" do
      get :show, params: {id: @dashboard.to_param}
      expect(assigns(:dashboard)).to eq(@dashboard)
    end
  end
end
