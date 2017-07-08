class RegistrationsController < Devise::RegistrationsController
  def create
    super
    dashboard = resource.dashboards.new
    dashboard.save
  end
end
