require_relative '../../db/config'
require_relative 'congress_member'

class Senator < CongressMember
	def self.add_congress_member
		CongressMember.where('title = ?', 'Sen').each do |congress_member_data|
			Senator.create(congress_member_data.serializable_hash)
		end
	end
end
