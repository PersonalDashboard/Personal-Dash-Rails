require 'rails_helper'

describe Dashboard, type: :model do
  let(:dashboard) { FactoryGirl.create(:dashboard) }

  describe "address for maps" do

    it "returns formatted home address" do
      expect(dashboard.home_address_for_maps). to eq("#{dashboard.user.home_address}+#{dashboard.user.home_city}+#{dashboard.user.home_state}")
    end

    it "returns formatted work address" do
      expect(dashboard.work_address_for_maps).to eq("#{dashboard.user.work_address}+#{dashboard.user.work_city}+#{dashboard.user.work_state}")
    end
  end
end
