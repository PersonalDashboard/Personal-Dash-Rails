module ExternalData
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

  def news_link(results)
    results.map do |result|
      "<a href='#{result["url"]}'>#{result["title"]}</a>"
    end
  end

  def how_to_link(result)
    "<a href='#{result["url"]}'>#{result["title"]}</a>"
  end

  def map_link(widget)
    "https://www.google.com/maps/embed/v1/directions?key=#{ENV['MAPS_API_KEY']}&origin=#{home_address(widget)}&destination=#{work_address(widget)}"
  end

  def home_address(widget)
    data = widget_data(widget)
    address_components = data.data.split(',')[0..2]
    address_components[0] = address_components[0].parameterize.underscore
    address_components.join('+')
  end

  def work_address(widget)
    data = widget_data(widget)
    address_components = data.data.split(',')[3..5]
    address_components[0] = address_components[0].parameterize.underscore
    address_components.join('+')
  end

  def widget_data(widget)
    @widget_datum.find_by_widget_id(widget.id)
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

  def ssl?(protocol)
    protocol == "https"
  end

  def widget_api_data(widget)
    data = Hash.new
    widget_name_key(widget).each { |name, map| data[name] = widget_data_results(name, map, widget) }
    data
  end

  def widget_data_results(name, map, widget)
    results = get_results(map, widget)
    parsed_results = parse_results(results, map["path"])
    finalize_results(parsed_results, map["post_processor"])
  end

  def get_results(map, widget)
    if map["map"] && !widget.data_url
      map_link(widget)
    else
      get_data(widget.data_url, ssl?(map["protocol"]))
    end
  end

  def widget_name_key(widget)
    name = widget.name.parameterize.underscore
    api_map = YAML.load_file("#{Rails.root}/config/api_map.yml")
    api_map[name]
  end

  def finalize_results(results, post_processor)
    post_processor_exists?(post_processor) ? post_processed_results(results, post_processor) : results
  end

  def post_processor_exists?(post_processor)
    post_processor && respond_to?(post_processor.to_sym)
  end

  def post_processed_results(results, post_processor)
    public_send(post_processor.to_sym, results)
  end

  def parse_results(results, path)
    return results unless path
    path_array = path.split(',')

    path_as_nav = ""
    path_array.each do |item|
      if /\A\d+\z/ =~ item
        path_as_nav << "[#{item}]"
      else
        path_as_nav << "['#{item}']"
      end
    end

    eval("#{results}#{path_as_nav}")
  end
end
