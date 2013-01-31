require 'httparty'

module Distance
  extend self

  DBC_LOCATIONS = ['717 California St, San Francisco, CA', '414 N. Orleans St, Chicago, IL']

  def calculate(address)
    closest_address = min_distance = result = nil

    DBC_LOCATIONS.each do |dbc_address|
      dbc_address = prepare_address(dbc_address)
      address = prepare_address(address)

      result = HTTParty.get("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{address}&destinations=#{dbc_address}&mode=walking&units=imperial&sensor=false")

      distance = to_distance(result).to_i
      min_distance ||= distance
      if distance < min_distance
        min_distance = distance
        closest_address = dbc_address
      end
    end

    return {
      :distance => to_distance(result),
      :duration => to_duration(result)
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