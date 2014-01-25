require 'csv'
require_relative '../config'


class ChangeTwitter < ActiveRecord::Migration
  def change
    remove_column :congress_tweets, :tweet_text
    add_column :congress_tweets, :tweet_text, :string
  end
end


