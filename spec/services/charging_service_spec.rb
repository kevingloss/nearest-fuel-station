require 'rails_helper'

RSpec.describe 'charging service' do 
  describe 'class methods' do 
    it 'returns the nearest charging station', :vcr do 
      station = ChargingService.nearest_station('4994 lowell blvd,denver,co,80221')
      
      expect(station).to be_an_instance_of(Hash)
      expect(station).to have_key(:fuel_stations)
      expect(station[:fuel_stations]).to be_a(Array)
      expect(station[:fuel_stations].first).to have_key(:station_name)
      expect(station[:fuel_stations].first).to have_key(:fuel_type_code)
      expect(station[:fuel_stations].first).to have_key(:street_address)
      expect(station[:fuel_stations].first).to have_key(:city)
      expect(station[:fuel_stations].first).to have_key(:state)
      expect(station[:fuel_stations].first).to have_key(:zip)
      expect(station[:fuel_stations].first).to have_key(:access_days_time)
    end
  end
end