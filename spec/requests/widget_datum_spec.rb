require 'rails_helper'

RSpec.describe "Widget datum", type: :request do
  let(:dashboard) { FactoryGirl.create(:dashboard) }
  before(:each) { sign_in dashboard.user }

  describe 'form' do
    it 'adds data to widget', js: true do
      visit widgets_path
      check 'Weather'
      data = WidgetDatum.last
      visit edit_widget_datum_path(data)
      fill_in('city', with: 'Jacksonville')
      fill_in('state', with: 'FL')
      click_button('Save')
      expect(page).to have_content('Weather')
      expect(data.reload.data).to eq('Jacksonville,FL')
    end
  end
end
