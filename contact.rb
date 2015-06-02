require './contact_database.rb'
require 'pry'

class Contact
 
  # @@count = 0
  @@all_contacts = []

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    # @id = @@count
    # @@count += 1
    # @@all_contacts << self # could use this instead of create class method
  end
 
  def to_s
    # TODO: return string representation of Contact
    "#{@name} (#{@email})" # also need id number
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      contact = Contact.new(name, email)
      @@all_contacts << contact
    end
 
    def find(index)
      # TODO: Will find and return contact by index
      found_contacts = []
      # binding.pry
      @@all_contacts.each do |contact|
        (found_contacts << contact) if (contact.email.include?(index) || contact.name.include?(index))
      end
      found_contacts
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@all_contacts.each do |contact|
        puts contact.to_s
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      @@all_contacts[id]
    end
    
  end
 
end