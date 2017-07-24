require 'rails_helper'

describe "Dashboards", type: :request do
  let(:dashboard) { FactoryGirl.create(:dashboard) }
  it "should display the standard widgets" do
    sign_in dashboard.user
    visit root_path
    expect(page).to have_content(dashboard.user.home_city.capitalize)
    expect(page).to have_content("News")
    expect(page).to have_content("How To")
    expect(page).to have_content("Quote of the Day")
    expect(page).to have_content("Traffic")
  end
end

