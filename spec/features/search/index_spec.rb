require 'rails_helper'

RSpec.describe 'search for nearest station' do 
  it 'finds the nearest station and provides details', :vcr do
    station = ChargingFacade.nearest_station("4994 Lowell Blvd, Denver, CO 80221")
    map = MapFacade.directions("4994 Lowell Blvd, Denver, CO 80221", station.address)

    visit '/'

    select 'The Noshery', from: 'location'
    click_on 'Find Nearest Station'

    expect(current_path).to eq('/search')
    expect(page).to have_content(station.name)
    expect(page).to have_content(station.address)
    expect(page).to have_content(station.fuel_type)
    expect(page).to have_content(station.access_times)
    expect(page).to have_content(map.distance)
    expect(page).to have_content(map.time)
    expect(page).to have_content(map.directions.first)
    expect(page).to have_content(map.directions.last)
  end
end