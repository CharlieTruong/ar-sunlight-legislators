require_relative '../../db/config'
require_relative 'congress_member'
require_relative 'state'
require_relative 'political_party'


class Legislator < ActiveRecord::Base


  def self.transfer_state_data
    states = Array.new
    Legislator.all.each{|data| states.push(data[:state])}
    states.uniq!
    states.each{|state|State.create({state: state})}
  end

  def self.transfer_political_party
    parties = Array.new
    Legislator.all.each{|data| parties.push(data[:party])}
    parties.uniq!
    parties.each{|party|PoliticalParty.create({party_name: party})}
  end

  def self.transfer_congress_member
    Legislator.all.each do |congress_member_data|
      CongressMember.create({
        :name => congress_member_data.fullname,
        :phone => congress_member_data.format_phone,
        :fax  => congress_member_data[:fax],
        :website => congress_member_data[:website],
        :webform => congress_member_data[:webform],
        :gender => congress_member_data[:gender],
        :birthdate  => congress_member_data[:birthdate],
        :twitter_id => congress_member_data[:twitter_id],
        :title => congress_member_data[:title],
        :political_party_id => congress_member_data.add_political_party_id, 
        :state_id => congress_member_data.add_state_id
        })
    end
  end

  def self.add_in_office_congress_member
    CongressMember.all.each do |congress_member_data|
      congress_member_data.in_office = Legislator.find_by(id: congress_member_data.id)[:in_office]
      congress_member_data.save
    end
  end

  def format_phone
    phone.gsub(/-/,"")
  end

  def fullname
    firstname + " " + lastname
  end

  def add_state_id
    State.find_by(state: state)[:id]
  end

  def add_political_party_id
    PoliticalParty.find_by(party_name: party)[:id]
  end
end

#Legislator.transfer_state_data
#Legislator.transfer_political_party
#Legislator.transfer_congress_member
#Legislator.add_in_office_congress_member