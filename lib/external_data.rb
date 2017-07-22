module ExternalData
  def get_weather_data
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{@dashboard.user.home_city}&units=metric&appid=42009b873989896f45246d961a6a290c"
    weather_data = get_data(url, false)
    temp = fahrenheit(weather_data["main"]["temp"])
    current_weather_icon = weather_icon(weather_data["weather"][0]["id"])
    [temp, current_weather_icon]
  end

  def get_news_articles
    url = "http://newsapi.org/v1/articles?source=bbc-news&apiKey=2a593a55a7764c31939325eb9e41d54b"
    get_data(url, false)["articles"]
  end

  def get_how_to_data
    url = "https://www.reddit.com/r/howto.json"
    get_data(url, true)["data"]["children"][0]["data"]
  end

  def get_quote_data
    url = "https://favqs.com/api/qotd"
    get_data(url, true)["quote"]["body"]
  end

  def fahrenheit(temp)
    ((temp * 1.8) + 32).round
  end

  def weather_icon(code)
    prefix = 'wi wi-'
    weather_icons = JSON.parse(File.read("#{Rails.root}/weather_icons.json"))
    icon = weather_icons[code.to_s]["icon"]
    if !(code > 699 && code < 800) && !(code > 899 && code < 1000)
      icon = 'day-' + icon
    end
    "#{prefix}#{icon}"
  end

  def get_data(url, ssl = false)
    url = URI.parse(url)
    req = Net::HTTP.new(url.host, url.port)
    if ssl
      req.use_ssl = true
      req.verify_mode = OpenSSL::SSL::VERIFY_PEER
    end
    res = req.get(url)
    JSON.parse(res.body)
  end
end
