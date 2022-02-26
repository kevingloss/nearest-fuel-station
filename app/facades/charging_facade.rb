class ChargingFacade 
  class << self 
    def nearest_station(location)
      data = ChargingService.nearest_station(location)

      Station.new(data[:fuel_stations])
    end
  end
end