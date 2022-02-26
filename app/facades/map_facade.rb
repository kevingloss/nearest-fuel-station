class MapFacade 
  class << self 
    def directions(start, finish) 
      map_data = MapService.directions(start, finish)[:route]

      Map.new(map_data)
    end
  end
end