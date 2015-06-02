require './contact_database.rb'
require 'pry'

class Contact
 
  @@all_contacts = []

  attr_accessor :name, :email, :phone, :label

  def initialize(name, email, phone, label)
    @name = name
    @email = email
    (phone != nil && phone != "nil") ? @phone = Array(label).zip(Array(phone)).to_h : @phone = {}
  end
 
  def to_s
    id = nil
    (0..@@all_contacts.length-1).each do |contact_id|
      (id = contact_id + 1) if (self == @@all_contacts[contact_id])
    end
    if self.phone.length == 1
      "ID ##{id}: #{@name} (#{@email}, #{@phone.length} phone number stored)"
    else
      "ID ##{id}: #{@name} (#{@email}, #{@phone.length} phone numbers stored)"
    end
  end
 
  class << self
    def create(name, email, phone, label)
      contact = Contact.new(name, email, phone, label)
      @@all_contacts << contact
      "You added: #{contact.to_s}"  
    end
 
    def find(index)
      found_contacts = []
      @@all_contacts.each do |contact|
        (found_contacts << contact.to_s) if (contact.email.downcase.include?(index.downcase) || contact.name.downcase.include?(index.downcase))
      end
      found_contacts
    end
 
    def all
      @@all_contacts.each do |contact|
        puts contact.to_s
      end
    end
    
    def show(id)
      @@all_contacts[id]
    end

    def contact_replicate?(email)
      replicate = false
      @@all_contacts.each do |contact|
        # binding.pry
        replicate = true if contact.email.downcase.include?(email.downcase)
      end
      replicate
    end
  end
end