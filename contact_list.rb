require_relative 'contact'
require_relative 'contact_database'
require 'pry'

csv_database = ContactDatabase.new("contacts.csv")

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

	Contact.new(name,email) 			# make new contact instance
	Contact.create(name, email)		# add new contact to the class database
	csv_database.add_contact(name,email)    # add to csv database

when "list"


when "show"
	# id = AGRV[1]
	# show(id)
	puts Contact.show.inspect

when "find"
	# search_term = ARGV[1]
	# Contact.find(search_term)
	# search for name "search_term" and spit it out

end
