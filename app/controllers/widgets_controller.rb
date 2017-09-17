class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
    @user_widget_data = WidgetDatum.where(user_id: current_user.id)

    @user_widgets = @user_widget_data.map do |data|
      @widgets.detect { |widget| data.widget_id == widget.id}
    end
  end
end
