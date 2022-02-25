require 'rails_helper'

RSpec.describe 'map service' do 
  describe 'class methods' do 
    it 'returns the directions', :vcr do 
      map = MapService.directions('4994 lowell blvd,denver,co,80221','5809 W 44th Ave,Denver,CO,80212')

      expect(map).to be_an_instance_of(Hash)
      expect(map).to have_key(:route)
      expect(map[:route]).to have_key(:distance)
      expect(map[:route]).to have_key(:formattedTime)
      expect(map[:route]).to have_key(:legs)
      expect(map[:route][:legs]).to be_a(Array)
      expect(map[:route][:legs].first).to have_key(:maneuvers)
      expect(map[:route][:legs].first[:maneuvers]).to be_a(Array)
      expect(map[:route][:legs].first[:maneuvers].first).to have_key(:narrative)
    end
  end
end