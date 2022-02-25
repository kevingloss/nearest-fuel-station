class MapService 
  def self.connection 
    Faraday.new(url: 'http://www.mapquestapi.com/directions/v2/route') do |faraday|
      faraday.params['key'] = ENV['map_api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(start, finish) 
    response = connection.get do |faraday|
      faraday.params['from'] = start
      faraday.params['to'] = finish
    end

    data = parse_json(response)
  end
end