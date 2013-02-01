require 'httparty'

module Distance
  extend self

  DBC_LOCATIONS = ['717 California St, San Francisco, CA', '414 N. Orleans St, Chicago, IL']

  def calculate(address)
    closest_address = min_distance = result = nil

    DBC_LOCATIONS.each do |dbc_address|
      encoded_dbc_address = prepare_address(dbc_address)
      encoded_address = prepare_address(address)

      result = HTTParty.get("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{encoded_address}&destinations=#{encoded_dbc_address}&mode=walking&units=imperial&sensor=false")
      distance = to_distance(result).delete(",").to_i

      min_distance ||= distance
      closest_address ||= dbc_address

      if distance < min_distance
        min_distance = distance
        closest_address = dbc_address
      end
    end

    return {
      :distance => to_distance(result),
      :duration => to_duration(result),
      :location => closest_address
    }
  end

  def to_distance(result)
    result["rows"][0]["elements"][0]["distance"]["text"]
  end

  def to_duration(result)
    result["rows"][0]["elements"][0]["duration"]["text"]
  end

  def prepare_address(raw)
    raw.split(' ').join('%20')
  end
end