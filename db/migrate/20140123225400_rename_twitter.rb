require 'csv'
require_relative '../config'


class RenameTwitter < ActiveRecord::Migration
  def change
    rename_table :congresstweets, :congress_tweets
  end
end

