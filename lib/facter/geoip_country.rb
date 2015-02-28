
require 'facter'
require 'net/http'
require 'json'

response = Net::HTTP.get_response("api.ipify.org","/?format=json")
ipaddress = JSON.parse(response.body)['ip']
response2 = Net::HTTP.get_response("freegeoip.net","/json/" + ipaddress)
# response2 = Net::HTTP.get_response("freegeoip.net","/json/8.8.8.8")
geoip = JSON.parse(response2.body)

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