## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
	attr_reader :contacts
	def initialize(filename)
		@filename = filename
	end

	def read_contacts
		@contacts = CSV.read(@filename)
	end

	def add_contact(name, email, phone, label)
		if phone.length <= 1
			CSV.open(@filename, "a+") do |csv|
				csv << [name, email, phone[0], label[0]]
			end
		else
			(0..phone.length-1).each do |num|
				CSV.open(@filename, "a+") do |csv|
					csv << [name, email, phone[num], label[num]]
				end
			end
		end
	end
end