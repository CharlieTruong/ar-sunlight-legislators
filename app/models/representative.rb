require_relative '../../db/config'
require_relative 'congress_member'

class Representative < CongressMember
	def self.add_existing_congress_member
		CongressMember.where('title = ?', 'Rep').each do |congress_member_data|
			congress_member_data.type = "Representative"
      congress_member_data.save
		end
	end
end
