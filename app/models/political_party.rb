require_relative '../../db/config'

class PoliticalParty < ActiveRecord::Base
	has_many :congress_members
end