$(function(){
  var date = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
  $('#time').html(date);

  $('.collapse-btn').on('click', function(){
    toggleWindow($(this));
    toggleWindowIndicator($(this));
  });
});

function toggleWindow(collapse_button){
  collapse_button.closest('.panel').find('.panel-body').toggleClass('collapse');
}
function toggleWindowIndicator(collapse_button){
  collapse_button.find('i').toggleClass('glyphicon-chevron-up').toggleClass('glyphicon-chevron-down');
}
