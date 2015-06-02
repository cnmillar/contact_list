require './contact_database.rb'

filename = "contacts.csv"
new_contact = ContactDatabase.new(filename)
puts new_contact.inspect
puts new_contact.read_contacts.inspect
new_contact.add_contact("McLaren","Christine", "1234565")
puts new_contact.read_contacts.inspect
puts ContactDatabase

