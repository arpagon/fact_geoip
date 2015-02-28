# fact_geoip

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with fact_geoip](#setup)
    * [What fact_geoip affects](#what-fact_geoip-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with fact_geoip](#beginning-with-fact_geoip)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module is a custom fact that returns the geographical information and ip address of the agents edge ip address to
the internet.

This can be very useful if you are using puppet with roaming devices(laptops, failover vms, etc...)

## Module Description

Ever want to know where a puppet agent "Actually" is?  Maybe you are managing a fleet of laptops for a sales force, and
want to track location of it's internet connection?  Or how about applying the timezone for a server based on it's
internet egress point, without any hardcoding?

This module utilizes 2 cloud based services, [ipify](http://www.ipify.org), and [freegeoip](https://freegeoip.net), to get
the internet egress point IP address(edge router), and it's geolocation information.

## Setup

### What fact_geoip affects

* Nothing


### Beginning with fact_geoip

Just install the module

```ruby
puppet module install vormetriclabs/fact_geoip

```


## Reference

The list of facts returned about the location of the devices internet egress point.

- geoip_city => Mountain View
- geoip_country_code => US
- geoip_country_name => United States
- geoip_ipaddress => 8.8.8.8
- geoip_latitude => 37.386
- geoip_longitude => -122.084
- geoip_metro_code => 807
- geoip_region_code => CA
- geoip_region_name => California
- geoip_time_zone => America/Los_Angeles

## Limitations

Anything that supports Ruby net/http

## Development

Feel free to fork, code up, and pull request.

