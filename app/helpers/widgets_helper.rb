module WidgetsHelper
  def widget_data_id(widget)
    if @user_widgets.include?(widget)
      @user_widget_data.detect{ |data| data.widget == widget }.id
    end
  end
end
