require 'csv'
require_relative '../config'


class CreateTables < ActiveRecord::Migration
  def change
    headers = "title,firstname,middlename,lastname,name_suffix,nickname,party,state,district,in_office,gender,phone,fax,website,webform,congress_office,bioguide_id,votesmart_id,fec_id,govtrack_id,crp_id,twitter_id,congresspedia_url,youtube_url,facebook_id,official_rss,senate_class,birthdate"
    create_table :legislators do |t|
      headers.split(',').each do |header| 
        case header
        when 'twitter_id' then t.string header.to_sym
        when /_id$/  then t.integer header.to_sym
        when /date$/ then t.date header.to_sym
        when 'in_office' then t.boolean header.to_sym
        else t.string header.to_sym
        end
      end
      t.timestamps
    end
  end
end

