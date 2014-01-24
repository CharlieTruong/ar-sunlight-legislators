require_relative '../../db/config'

class CongressMember < ActiveRecord::Base
	validate :check_phone_format
	belongs_to :state
	belongs_to :political_party

	def check_phone_format
		errors.add(:phone, message="The phone number cannot include '-'.") if phone.include? "-"
	end
end
