require_relative '../../db/config'
require_relative 'congress_member'

class Senator < CongressMember
	def self.add_existing_congress_member
		CongressMember.where('title = ?', 'Sen').each do |congress_member_data|
		  congress_member_data.type = "Senator"
      congress_member_data.save
		end
	end
end
