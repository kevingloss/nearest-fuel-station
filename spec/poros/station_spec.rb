require 'rails_helper'

RSpec.describe Station do
  it 'has attributes' do
    data = [{
      station_name: 'xyz',
      street_address: '1234 xyz st',
      city: 'Denver',
      state: 'CO',
      zip: '80201',
      fuel_type_code: 'Elec',
      access_days_time: '24/7'
    }]

    station = Station.new(data)

    expect(station).to be_a(Station)
    expect(station.name).to eq('xyz')
    expect(station.address).to eq('1234 xyz st, Denver, CO, 80201')
    expect(station.fuel_type).to eq('Elec')
    expect(station.access_times).to eq('24/7')
  end
end
