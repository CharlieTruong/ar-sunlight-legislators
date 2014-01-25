require 'csv'
require_relative '../config'


class AddTwitter < ActiveRecord::Migration
  def change
    create_table :congresstweets do |t|
      t.integer :tweet_id
      t.integer :tweet_text
      t.belongs_to :congress_member
      t.integer :congress_member_id
      t.timestamps
    end
  end
end

