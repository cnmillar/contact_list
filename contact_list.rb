require_relative 'contact'
require_relative 'contact_database'
require 'pry'

csv_database = ContactDatabase.new("contacts.csv")
# Add contacts from csv file to database
csv_contacts = csv_database.read_contacts
csv_contacts.each do |contact|
	Contact.create(contact[0], contact[1])
end

# binding.pry

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

	new_contact = Contact.new(name,email) 		# make new contact instance
	Contact.create(name, email)								# add new contact to the class database
	csv_database.add_contact(name,email)    	# add to csv database
	puts new_contact.to_s											# spit out new contact's information

when "list"
	puts Contact.all

when "show"
	id = ARGV[1].to_i + 1
	puts Contact.show(id)

when "find"
	search_term = ARGV[1]
	puts Contact.find(search_term)
end
