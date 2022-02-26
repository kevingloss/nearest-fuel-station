class SearchController < ApplicationController 
  def index
    @station = ChargingFacade.nearest_station(params[:location])
    @map = MapFacade.directions(params[:location], @station.address)
  end
end