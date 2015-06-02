require './contact_database.rb'

class Contact
 
  @@count = 0
  @@all_contacts = []

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @id = @@count
    @@count += 1
    @@all_contacts << self
  end
 
  def to_s
    # TODO: return string representation of Contact
    "#{@name} (#{@email})"
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      
    end
 
    def find(index)
      # TODO: Will find and return contact by index
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@all_contacts
    end
    
    def show
      # TODO: Show a contact, based on ID
      @@all_contacts
    end
    
  end
 
end