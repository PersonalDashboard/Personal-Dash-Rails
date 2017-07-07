$(function(){
  var date = new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
  $('#time').html(date);

  $.getJSON("http://api.openweathermap.org/data/2.5/weather?q=" + $('#temp').data('city') + "&units=metric&appid=42009b873989896f45246d961a6a290c", function(data){
    $('#temp').html(tempInFahrenheit(data.main.temp));
    $('.weather-icon').addClass(weatherIcon(data.weather[0].id));
  });

  $.getJSON("https://newsapi.org/v1/articles?source=bbc-news&apiKey=2a593a55a7764c31939325eb9e41d54b", function(data){
   $.each(data.articles, function(e){
      article = data.articles[e]
      $('#newsfeed').append(newsArticle(article));
    });
  });

  $.getJSON("https://www.reddit.com/r/howto.json", function(data){
    article = howToData(data)
    $('#how-to').append(howToTitle(article.url, article.title));
    $('#how-to-thumb').append(howToThumbnail(article.thumbnail));
  });

  $.getJSON("https://favqs.com/api/qotd", function(data){
    quote = data.quote.body
    $('#quote').append("<div class='col-md-12'>" + quote + "</div>");
  });

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

function weatherIcon(code){
  var prefix = 'wi wi-';
  var icon = weatherIcons[code].icon;

  if (!(code > 699 && code < 800) && !(code > 899 && code < 1000)) {
    icon = 'day-' + icon;
  }
  return prefix + icon;
}

function tempInFahrenheit(temp){
  return Math.round((temp * 1.8) + 32) + '&deg;';
}

function howToData(data){
  return data.data.children[0].data;
}

function howToTitle(url, title){
  return "<div class='col-md-12'><a href=" + url + ">" + title + "</a></div>";
}

function howToThumbnail(thumbnail){
  return "<div class='col-md-12'><img src='" + thumbnail + "' height=\"75\" width=\"75\"/></div>";
}

function newsArticle(article){
  return "<div class='col-md-12'><a href=" + article.url + ">" + article.title + "</a></div>";
}

