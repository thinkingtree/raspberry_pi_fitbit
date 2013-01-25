#!/usr/bin/env ruby

require "#{File.dirname(__FILE__)}/environment.rb"

if raspberry_pi?
  `gpio mode 0 out`
  `gpio write 0 1`
  # @io = WiringPi::GPIO.new
  # @io.mode(0, OUTPUT)
  # @io.write(0, HIGH)
end

begin
  loop do
    File.open('/tmp/fitbit_leaderboard', 'w') { |f| f.write @client.weekly_leaderboard }
    sleep 60
  end
rescue Interrupt => e
  `gpio write 0 1` if raspberry_pi?
  #@io.write(0, LOW) if @io
end

