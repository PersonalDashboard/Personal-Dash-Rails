require 'net/http'
require 'net/https'
require 'external_data'

class DashboardsController < ApplicationController
  include ExternalData
  before_action :authenticate_user!

  def index
    redirect_to dashboard_path(current_user.dashboards.first)
  end

  def show
    @dashboard = Dashboard.find(params[:id])

    @widgets = WidgetDatum.user_widgets(current_user).map do |data|
      Widget.all.detect { |widget| data.widget_id == widget.id }
    end

    @data = Hash.new
    @widgets.each { |widget| @data[widget.name] = widget_api_data(widget) if widget.data_url }
    @templates = YAML.load_file("#{Rails.root}/config/widget_templates.yml")
  end
end
