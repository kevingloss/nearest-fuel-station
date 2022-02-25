class ChargingService 
  def self.connection 
    Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |faraday|
      faraday.params['api_key'] = ENV['charging_api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.nearest_station(location)
    response = connection.get do |faraday|
      faraday.params['location'] = location
    end

    parse_json(response)
  end
end