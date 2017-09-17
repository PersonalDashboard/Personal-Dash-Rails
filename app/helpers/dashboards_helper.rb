module DashboardsHelper
  def standard_template(widget)
    @templates["templates"][widget.name.parameterize.underscore]
  end

  def standard_template_for(widget)
    output = standard_template(widget).map do |name, segment|
      segment["each"] ?  list_data(segment, widget, name) : standard_data(segment, widget, name)
    end
    output.join('')
  end

  def standard_data(segment, widget, name)
    "#{segment["start_body"]}#{data_item(widget, name)}#{segment["end_body"].to_s}"
  end

  def list_data(segment, widget, name)
    "#{segment["start_body"]}#{list_item_collection(segment, widget, name)}#{segment["end_body"]}"
  end

  def list_item_collection(segment, widget, name)
    @data[widget.name][name].map { |item| list_item(segment, item) }.join('')
  end

  def list_item(segment, item)
    "#{segment["each"]["start_body"]}#{item}#{segment["each"]["end_body"]}"
  end

  def data_item(widget, name)
    @data[widget.name][name].to_s if @data[widget.name]
  end

  def map_template(widget)
    @templates["map_template"][widget.name.parameterize.underscore]
  end

  def map_template_for(widget)
    output = map_template(widget).map do |name, segment|
      "#{segment["start_body"]}#{@dashboard.map_link}#{segment["end_body"]}"
    end
    output.join('')
  end
end
