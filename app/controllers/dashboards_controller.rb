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

    @widget_datum = WidgetDatum.user_widgets(current_user)
    @widgets = @widget_datum.map do |data|
      Widget.all.detect { |widget| data.widget == widget }
    end

    @data = Hash.new
    @widgets.each { |widget| @data[widget.name] = widget_api_data(widget) }
    @templates = YAML.load_file("#{Rails.root}/config/widget_templates.yml")
  end
end
