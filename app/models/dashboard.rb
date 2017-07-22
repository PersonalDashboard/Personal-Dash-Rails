class Dashboard < ApplicationRecord
  belongs_to :user

  def home_address_for_maps
    "#{self.user.home_address}+#{self.user.home_city}+#{self.user.home_state}"
  end

  def work_address_for_maps
    "#{self.user.work_address}+#{self.user.work_city}+#{self.user.work_state}"
  end
end
