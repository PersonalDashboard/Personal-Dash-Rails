class Dashboard < ApplicationRecord
  belongs_to :user

  def map_link
    "https://www.google.com/maps/embed/v1/directions?key=#{ENV['MAPS_API_KEY']}&origin=#{home_address_for_maps}&destination=#{work_address_for_maps}"
  end

  private
    def home_address_for_maps
      "#{self.user.home_address.parameterize.underscore}+#{self.user.home_city}+#{self.user.home_state}"
    end

    def work_address_for_maps
      "#{self.user.work_address.parameterize.underscore}+#{self.user.work_city}+#{self.user.work_state}"
    end
end
