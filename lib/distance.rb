require 'httparty'

module Distance

  def self.calculate(address)
    dbc_address = '717 California St, San Francisco, CA'.split(' ').join('%20')
    address = address.split(' ').join('%20')
    result = HTTParty.get("http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{address}&destinations=#{dbc_address}&mode=walking&units=imperial&sensor=false")

    return {
          :distance => result["rows"][0]["elements"][0]["distance"]["text"],
          :duration => result["rows"][0]["elements"][0]["duration"]["text"]
          }

  end

end