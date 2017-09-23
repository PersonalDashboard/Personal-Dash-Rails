require 'rails_helper'

describe "Dashboards", type: :request do
  let(:dashboard) { FactoryGirl.create(:dashboard) }
  describe 'menu' do
    it "should display menu items" do
      visit root_path
      expect(page).to have_content("Widgets")
      expect(page).to have_content("Dashboard")
      expect(page).to have_content("Log Out")
    end
  end

  context 'displaying standard widgets' do
    before(:each) { sign_in dashboard.user }
    context 'user has added a widget' do
      it 'shows the widget on the dashboard' do
        news_widget = Widget.find_by_name("News")
        WidgetDatum.create(user_id: dashboard.user.id, widget_id: news_widget.id)
        visit root_path
        expect(page).to have_content("News")
      end
    end

    context 'user has not added widgets' do
      it 'should not show widget' do
        visit root_path
        expect(page).not_to have_content("News")
      end
    end
  end
end

