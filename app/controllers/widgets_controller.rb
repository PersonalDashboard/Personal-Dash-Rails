class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
    @user_widget_data = WidgetDatum.where(user: current_user)

    @user_widgets = @user_widget_data.map do |data|
      @widgets.detect { |widget| data.widget == widget}
    end
  end
end
