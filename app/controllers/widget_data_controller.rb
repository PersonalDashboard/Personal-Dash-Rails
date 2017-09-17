class WidgetDataController < ApplicationController
  before_action :set_widget_variables, only: [:edit, :update]

  def create
    widget_data = WidgetDatum.create(user_id: params[:user], widget_id: params[:widget])

    respond_to do |format|
      format.json do
        data = {widget_data: widget_data.id}
        render json: data
      end
    end
  end

  def destroy
    WidgetDatum.destroy(params[:id])
    respond_to do |format|
      format.json do
        render json: {success: true}
      end
    end
  end

  def edit
  end

  def update
    field_names = @widget.field_names.split(',')
    @widget_data.data = field_names.map{ |name| params[name]}.join(',')

    if @widget_data.save
      flash[:notice] = "Widget data updated"
      redirect_to widgets_path
    else
      flash[:error] = "Widget data update failed"
      redirect_back(fallback_location: widgets_path)
    end

  end

  private
    def set_widget_variables
      @widget_data = WidgetDatum.find(params[:id])
      @widget = Widget.find(@widget_data.widget_id)
    end
end
