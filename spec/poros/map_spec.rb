require 'rails_helper'

RSpec.describe Map do
  it 'has attributes' do
    data = {
      distance: 'xyz',
      formattedTime: '00:04:53',
      legs: [
        maneuvers: [
          {
              narrative: "Start out going south on N Lowell Blvd toward W 49th Ave.",
          },
          {
              narrative: "Turn right onto W 44th Ave.",
          },
          {
              narrative: "5809 W 44TH AVE is on the right.",
          }
        ]
      ]
    }

    map = Map.new(data)

    expect(map).to be_a(Map)
    expect(map.distance).to eq('xyz')
    expect(map.time).to eq('00:04:53')
    expect(map.directions).to eq(["Start out going south on N Lowell Blvd toward W 49th Ave.", "Turn right onto W 44th Ave.", "5809 W 44TH AVE is on the right."])
  end
end