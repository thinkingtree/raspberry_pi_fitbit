#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/environment.rb"

if raspberry_pi?
  @io = WiringPi::GPIO.new
  @io.mode(0, OUTPUT)
  @io.write(0, HIGH)
end

begin
  loop do
    File.open('/tmp/fitbit_leaderboard', 'w') { |f| f.write @client.weekly_leaderboard }
    sleep 60
  end
rescue Interrupt => e
  @io.write(0, LOW) if @io
end

