require_relative 'contact'
require_relative 'contact_database'
require 'pry'

csv_database = ContactDatabase.new("contacts.csv")
csv_contacts = csv_database.read_contacts
csv_contacts.each do |contact|
	Contact.create(contact[0], contact[1], contact[2], contact[3])
end

case ARGV[0].downcase

when "help"
	puts "Here is a list of available commands:
	new - Create a new contact
	list - List all contacts
	show - Show a contact
	find - Find a contact"

when "new"
	puts "What is the name of the new contact?"
	name = STDIN.gets.chomp
	puts "What is their email address?"
	email = STDIN.gets.chomp
	phone = []
	label = []
	answer = "yes"

	while answer == "yes"
		puts "Would you like to add a new phone number (YES or NO)?"
		answer = STDIN.gets.chomp
		if answer.downcase == "yes"
			puts "What label would you like to give the phone number (e.g., mobile)?"
			label << STDIN.gets.chomp
			puts "What is their phone number?"
			phone << STDIN.gets.chomp
		end
	end

	phone = nil if phone.empty?

	puts phone.inspect

	if Contact.contact_replicate?(email)
		puts "Contact already exists. Use 'find' to search for '#{email}'."
	else
		contact_string = Contact.create(name, email, phone, label)	
		binding.pry				
		csv_database.add_contact(name,email, phone, label)    	
		puts contact_string					
	end				

when "list"
	Contact.all

when "show"
	id = ARGV[1].to_i - 1
	puts Contact.show(id)

when "find"
	search_term = ARGV[1]
	puts Contact.find(search_term)
end
