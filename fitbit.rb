#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/environment.rb"

while true
  File.open('/tmp/fitbit_leaderboard', 'w') { |f| f.write @client.weekly_leaderboard }
  sleep 60
end

