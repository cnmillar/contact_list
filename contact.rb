require 'pg'
require 'pry'
require 'active_record'    

class Contact < ActiveRecord::Base

  has_many :phones

	# attr_reader :firstname, :lastname, :email, :id

	# Instance variable to initialize new instance of Contact class
  # def initialize(lastname, firstname, email, id=nil)
  #   @lastname = lastname
  #   @firstname = firstname
  #   @email = email
  #   @id = id
  # end

# ### CLASS METHODS ###
	
# 	# Update contact
# 	def self.update(id, firstname, lastname, email)
# 		# pg_result = @@conn.exec_params("UPDATE contacts SET firstname='#{firstname}', lastname='#{lastname}', email='#{email}' WHERE id=#{id}")  	
# 	end

# 	# Convert pg object to an array of class instances
# 	def self.to_array(pg_result)
# 		result = []
# 		pg_result.each do |row|
# 			result << Contact.new(row["lastname"], row["firstname"], row["email"], row["id"])
# 		end
# 		result
# 	end

# 	# Find contact from id
#   def self.find(id)
#   	# pg_result = @@conn.exec_params("SELECT * FROM contacts WHERE id = $1", [id])
#   	self.to_array(pg_result).first
#   end

#     # Remove contact instance from database
#   def self.destroy(id)
#   	# @@conn.exec_params("DELETE FROM contacts WHERE id = $1;", [id])
#   end

#   # Show all entries
#   def self.all
#   	# pg_result = @@conn.exec("SELECT * FROM contacts;")
#   	to_array(pg_result)
#   end

#   # Search by lastname
#   def self.find_all_by_lastname(lastname)
#   	# pg_result = @@conn.exec_params("SELECT * FROM contacts WHERE lastname = $1;", [lastname.capitalize])
#   	to_array(pg_result)
#   end

#   # Search by email
#   def self.find_by_email(email)
#   	# pg_result = @@conn.exec_params("SELECT * FROM contacts WHERE email = $1;", [email])
#   	to_array(pg_result)
#   end

end
