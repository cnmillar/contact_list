#!/usr/local/rvm/rubies/ruby-2.1.3/bin/ruby
require 'active_record'
require './setup'
require './contact'
require './phone'
require 'pry'

def new_contact
	puts "What is the first name of your new contact?"
	firstname = STDIN.gets.chomp
	puts "What is the last name of your new contact?"
	lastname = STDIN.gets.chomp
	puts "What is their email address?"
	email = STDIN.gets.chomp

	phone = []
	label = []
	new_phone = "yes"
	while  new_phone == "yes"
		puts "Would you like to add a phone number?"
		new_phone = STDIN.gets.chomp.downcase 
		if new_phone == "yes"
			puts "What is the number?"
			phone << STDIN.gets.chomp
			puts "How would you like to label this phone (e.g., mobile, home)?"
			label << STDIN.gets.chomp
		end
	end

	new_contact = Contact.create(lastname: lastname, firstname: firstname, email: email) 
 
	label.zip(phone).each do |pair|
		new_phone = Phone.create(label: pair[0], phone_number: pair[1], contact: new_contact)
	end

end

def show(id)
	contact_info = Contact.find(id).to_s
end

def delete
	# list
	puts "Which id number would you like to delete?"
	id = STDIN.gets.chomp
	contact_string = show(id)
	Contact.find(id).destroy
	puts "Contact deleted: #{contact_string}"
end

def loop_over_results(array)
	array.each do |row|
		puts row.to_s
	end
end

def list
	all_instances = Contact.all
	loop_over_results(all_instances)
end

def find
	search_term = ARGV[1]
	if search_term.include? '@'
		instance_result = Contact.find_by_email(search_term)
		loop_over_results(instance_result)
	else
		instance_result = Contact.find_all_by_lastname(search_term)
		loop_over_results(instance_result)
	end
end

def update
	# list
	puts "Which contact's id number would you like to update?"
	id = STDIN.gets.chomp.to_i
	puts "What would you like the contact's first name to be?"
	firstname = STDIN.gets.chomp
	puts "What would you like the contact's last name to be?"
	lastname = STDIN.gets.chomp
	puts "What would you like the contact's email to be??"
	email = STDIN.gets.chomp

	contact_to_update = Contact.find(id)
	contact_to_update.update(firstname: firstname, lastname: lastname, email: email)
	phone_numbers  = contact_to_update.phones 		# gives the Phone instances that belong to contact_to_update

	if phone_numbers.empty?
		puts "Would you like to add a phone number?"
		answer = STDIN.gets.chomp.downcase
		if answer == "yes"
			puts "What would you like the number to be?"
			new_number = STDIN.gets.chomp
			puts "What would you like its label to be?"
			new_label = STDIN.gets.chomp
			Phone.create(label: new_label, phone_number: new_number, contact: contact_to_update)
		end
	else
		phone_numbers.each do |phone|
			puts "What would you like to change #{phone[:phone_number]} to?"
			new_number = STDIN.gets.chomp
			phone.update(phone_number: new_number)
		end
	end
end

case ARGV[0].downcase
	when "help"
		puts "Here is a list of available commands:
		new - Create a new contact
		update - Update contact
		list - List all contacts
		show - Show a contact by id number
		find - Find a contact by last name or email
		delete - Delete contact"

	when "new"
		new_contact

	when "update"
		update

	when "delete"
		delete

	when "show"
		id = ARGV[1].to_i
		puts show(id)

	when "list"
		list

	when "find"
		find
end