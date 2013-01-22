require "rubygems"
require "bundler/setup"

desc 'Authorize app for access to fitbit API'
task :authorize do
  require 'fitgem'
  consumer_key = ENV['FITBIT_CONSUMER_KEY']
  consumer_secret = ENV['FITBIT_CONSUMER_SECRET']
  unless consumer_key && consumer_secret
    puts 'Please set FITBIT_CONSUMER_KEY and FITBIT_CONSUMER_SECRET environment variables'
    exit
  end

  client = Fitgem::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret})

  request_token = client.request_token
  token = request_token.token
  secret = request_token.secret

  puts "Go to http://www.fitbit.com/oauth/authorize?oauth_token=#{token} and then enter the verifier code below."

  verifier = STDIN.gets.chomp
  access_token = client.authorize(token, secret, { :oauth_verifier => verifier })

  puts "export FITBIT_CONSUMER_KEY=#{consumer_key}"
  puts "export FITBIT_CONSUMER_SECRET=#{consumer_secret}"
  puts "export FITBIT_TOKEN=#{access_token.token}"
  puts "export FITBIT_SECRET=#{access_token.secret}"
  puts "export FITBIT_USER_ID=<userid>"
end

desc 'Show user info'
task :user_info do
 require 'fitgem'
  consumer_key = ENV['FITBIT_CONSUMER_KEY']
  consumer_secret = ENV['FITBIT_CONSUMER_SECRET']
  token = ENV['FITBIT_TOKEN']
  secret = ENV['FITBIT_SECRET']
  user_id = ENV['FITBIT_USER_ID']
  unless consumer_key && consumer_secret && token && secret && user_id
    puts 'Please set FITBIT_CONSUMER_KEY, FITBIT_CONSUMER_SECRET, FITBIT_TOKEN, FITBIT_SECRET, FITBIT_USER_ID environment variables'
    exit
  end

  client = Fitgem::Client.new({:consumer_key => consumer_key, :consumer_secret => consumer_secret, :token => token, :secret => secret, :user_id => user_id})
  access_token = client.reconnect(token, secret)

  p client.user_info
end
