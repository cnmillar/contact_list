## TODO: Implement CSV reading/writing
require 'csv'

# attr_reader :contacts

class ContactDatabase
	def initialize(filename)
		@filename = filename
	end

	def read_contacts
		@contacts = CSV.read(@filename)
	end

	def add_contact(name, email)
		CSV.open(@filename, "a") do |csv|
			csv << [name, email]
		end
	end
end