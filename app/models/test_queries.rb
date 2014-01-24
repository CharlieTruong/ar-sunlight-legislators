require_relative '../../db/config'
require_relative 'congress_member'
require_relative 'state'
require_relative 'political_party'

#congress_member = CongressMember.new({name: "Charlie Truong", phone: "123-1234-123"})
#congress_member.save!
#p congress_member.errors.messages

def congress_member_by_state(state)
	puts "Senators:"
	State.find_by(state: state).congress_members.where('title = ?', "Sen").each do |congress_member|
		puts "#{congress_member.name} #{congress_member.political_party.party_name}"
	end

	puts "\nRepresentatives:"
	State.find_by(state: state).congress_members.where('title = ?', "Rep").each do |congress_member|
		puts "#{congress_member.name} #{congress_member.political_party.party_name}"
	end
end

def gender_data(gender, title)
	stats = Hash.new
	data_gender_only = CongressMember.where('gender = ? and title =? and in_office = ?', gender, title, true)
	data_all = CongressMember.where('title =? and in_office = ?', title, true)
	stats[:count] = data_gender_only.length
	stats[:pct] = (data_gender_only.length / data_all.length.to_f).round(2)
	stats
end

def print_gender_data(gender)
	stat_prefix = gender == "M" ? "Male" : "Female"
	senator_stats = gender_data(gender, "Sen")
	rep_stats = gender_data(gender, "Rep")
	puts "#{stat_prefix} Senators: #{senator_stats[:count]} (#{senator_stats[:pct]})"
	puts "#{stat_prefix} Representatives: #{rep_stats[:count]} (#{rep_stats[:pct]})"
end

def active_congress_members_by_state
	state_data = State.all.sort_by{|state| state.congress_members.where('in_office = ?', true).count}.reverse
	state_data.each do |state|
		name = state.state
		senate_count = state.congress_members.where('title = ? and in_office = ?','Sen', true).count
		rep_count = state.congress_members.where('title = ? and in_office = ?','Rep', true).count
		puts "#{name}: #{senate_count} Senators, #{rep_count} Representative(s)"
	end
end

def total_count
	puts "Senators: #{CongressMember.where('title = ?','Sen').count}"
	puts "Representatives: #{CongressMember.where('title = ?','Rep').count}"
end

#congress_member_by_state("LA")
#print_gender_data("M")
#total_count
active_congress_members_by_state