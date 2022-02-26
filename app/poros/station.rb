class Station 
  attr_reader :name, :address, :fuel_type, :access_times

  def initialize(data)
    @name = data.first[:station_name]
    @address = compile_address(data)
    @fuel_type = data.first[:fuel_type_code]
    @access_times = data.first[:access_days_time]
  end

  def compile_address(data)
    street = data.first[:street_address]
    city = data.first[:city]
    state = data.first[:state]
    zip = data.first[:zip]
    street + ', ' + city + ', ' + state + ', ' + zip
  end
end