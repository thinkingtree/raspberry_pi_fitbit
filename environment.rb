require 'rubygems'
require 'fitgem'

def raspberry_pi?
  RUBY_PLATFORM == 'arm-linux-eabihf'
end

require 'wiringpi' if raspberry_pi?

consumer_key = ENV['FITBIT_CONSUMER_KEY']
consumer_secret = ENV['FITBIT_CONSUMER_SECRET']
token = ENV['FITBIT_TOKEN']
secret = ENV['FITBIT_SECRET']
user_id = ENV['FITBIT_USER_ID']
unless consumer_key && consumer_secret && token && secret && user_id
  STDERR.puts 'Please set FITBIT_CONSUMER_KEY, FITBIT_CONSUMER_SECRET, FITBIT_TOKEN, FITBIT_SECRET, FITBIT_USER_ID environment variables'
  exit(1)
end

@client = Fitgem::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret, :token => token, :secret => secret, :user_id => user_id})
@access_token = @client.reconnect(token, secret)
