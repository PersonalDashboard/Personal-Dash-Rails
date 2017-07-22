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
    @temp, @current_weather_icon = get_weather_data
    @news_articles = get_news_articles
    @how_to_data = get_how_to_data
    @quote_data = get_quote_data
  end
end
