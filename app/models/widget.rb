class Widget < ApplicationRecord
  has_many :widget_data
  def self.seed_widgets
    create(name: "Weather", data_url: "http://api.openweathermap.org/data/2.5/weather?q=jacksonville&units=metric&appid=#{ENV['OPEN_WEATHER_MAP_API_KEY']}", field_names: "city,state")
    create(name: "News", data_url: "http://newsapi.org/v1/articles?source=bbc-news&apiKey=#{ENV['NEWS_API_KEY']}")
    create(name: "How To", data_url: "https://www.reddit.com/r/howto.json")
    create(name: "Quote of the day", data_url: "https://favqs.com/api/qotd")
    create(name: "Traffic", field_names: "home_address,home_city,home_state,work_address,work_city,work_state")
  end
end
