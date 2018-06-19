require 'facter'
require 'net/http'
require 'uri'
require 'json'

begin
  url = URI.parse("https://api.ipify.org/?format=json")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.read_timeout = 10
  http.open_timeout = 10
  response = http.start() {|http|
    http.get("/?format=json", {'Content-Type' => 'application/json'})
  }
  # response = Net::HTTP.get_response("api.ipify.org","/?format=json")
  begin
    ipaddress = JSON.parse(response.body)['ip']
  rescue JSON::ParserError => e
    ipaddress = "X.X.X.X"
  end
rescue SystemCallError
  ipaddress = "X.X.X.X"
end

begin
  url = URI.parse("https://freegeoip.net/json/" + ipaddress)
  http = Net::HTTP.new(url.host, url.port)

  http.use_ssl = true
  http.read_timeout = 10
  http.open_timeout = 10
  response2 = http.start() {|http|
    http.get("/json/" + ipaddress , {'Content-Type' => 'application/json'})
  }
  # response2 = Net::HTTP.get_response("freegeoip.net","/json/" + ipaddress)
  # response2 = Net::HTTP.get_response("freegeoip.net","/json/8.8.8.8")
  begin
    geoip = JSON.parse(response2.body)
  rescue JSON::ParserError => e
    geoip = {"error" => "No internet connectios"}
  end
rescue SystemCallError
  geoip = {"error"=> "No internet connectios"}
end

Facter.add('geoip_ipaddress') do
  setcode do
    ipaddress
  end
end

Facter.add('geoip_country_code') do
  setcode do
    geoip['country_code']
  end
end

Facter.add('geoip_country_name') do
  setcode do
    geoip['country_name']
  end
end

Facter.add('geoip_region_code') do
  setcode do
    geoip['region_code']
  end
end

Facter.add('geoip_region_name') do
  setcode do
    geoip['region_name']
  end
end

Facter.add('geoip_city') do
  setcode do
    geoip['city']
  end
end

Facter.add('geoip_zip_code') do
  setcode do
    geoip['zip_code']
  end
end

Facter.add('geoip_latitude') do
  setcode do
    geoip['latitude']
  end
end

Facter.add('geoip_longitude') do
  setcode do
    geoip['longitude']
  end
end

Facter.add('geoip_metro_code') do
  setcode do
    geoip['metro_code']
  end
end

Facter.add('geoip_country_code') do
  setcode do
    geoip['country_code']
  end
end


Facter.add('geoip_time_zone') do
  setcode do
    geoip['time_zone']
  end
end
