class Map 
  attr_reader :distance, :time, :directions 

  def initialize(data)
    @distance = data[:distance]
    @time = data[:formattedTime]
    @directions = directions_narrative(data)
  end

  def directions_narrative(data)
    instructions = []
    data[:legs].first[:maneuvers].each do |maneuver|
      instructions.push(maneuver[:narrative])
    end
    instructions
  end
end