require_relative '../../db/config'
require_relative 'congress_member'
require_relative 'representative'
require_relative 'senator'
require 'twitter'

class CongressTweet < ActiveRecord::Base
  validates :tweet_id, uniqueness: true
	belongs_to :congress_member

  def self.populate_from_twitter_id(congress_member)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ""
      config.consumer_secret = ""
    end
    begin
      client.user_timeline(congress_member.twitter_id).shift(10).each do |tweet|
        CongressTweet.create({tweet_id: tweet.id, tweet_text: tweet.text, congress_member_id: congress_member.id})
      end
    rescue
      puts "Twitter error!"
    end  
  end
end





