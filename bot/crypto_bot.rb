require 'dotenv'
require 'twitter'
require 'cryptocompare'

Dotenv.load


client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
end

user_request = Cryptocompare::Price.find('BTC', 'EUR')

prices = user_request['BTC']['EUR']

tweet = "Currently the Bitcoin price is #{prices}€"

client.update(tweet)