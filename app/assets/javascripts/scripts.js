$(document).on('turbolinks:load', function(){
  var date = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
  $('#time').html(date);

  $('.widget-check-container').each(function(element){
    data = $(this).data('widget-data')
    if(data){
      $(this).find('.checkbox-inline').after("<a href='/widget_data/" + data + "/edit'><i class='widget-settings-link fa fa-cog' aria-hidden='true'></i></a>");
      $(this).find('.widget-check').prop('checked', true);
    }
  });

  $('.collapse-btn').on('click', function(){
    toggleWindow($(this));
    toggleWindowIndicator($(this));
  });

  $('.widget-check').on('change', function(){
    this.checked ? createWidgetData($(this)) : deleteWidgetData($(this));
  });
});

function toggleWindow(collapse_button){
  collapse_button.closest('.panel').find('.panel-body').toggleClass('collapse');
}
function toggleWindowIndicator(collapse_button){
  collapse_button.find('i').toggleClass('glyphicon-chevron-up').toggleClass('glyphicon-chevron-down');
}
function deleteWidgetData(widgetCheck){
  widgetContainer = widgetCheck.closest('.widget-check-container');
  $.ajax({
    url: "/widget_data/" + widgetContainer.data('widget-data'),
    method: "DELETE",
    success: function(){
      widgetContainer.data('widget-data', '');
      widgetContainer.find('.widget-settings-link').remove();
    }
  });
}
function createWidgetData(widgetCheck){
  widgetContainer = widgetCheck.closest('.widget-check-container');
  $.post("/widget_data", {user: widgetCheck.data('user'), widget: widgetCheck.data('widget') }, function(data){
    widgetContainer.data('widget-data', data.widget_data);
    widgetContainer.find('.widget-settings-link').toggle();
    widgetContainer.find('.checkbox-inline').after("<a href='/widget_data/" + data.widget_data + "/edit'><i class='widget-settings-link fa fa-cog' aria-hidden='true'></i></a>");
  });
}
