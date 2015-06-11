require 'pry'
require 'active_record'

class Phone < ActiveRecord::Base

	belongs_to :contact

	# attr_reader :contact_id, :label, :phone, :id

	# def initialize(contact_id, label, phone, id = nil)
	# 	@contact_id = contact_id
	# 	@label = label
	# 	@phone = phone
	# 	@id = id
	# end
	
	# def save!
	# 	(0..phone.length).each do |index|
 #    	pg_result = @@conn.exec_params("INSERT INTO phones (contact_id, label, phone_number) VALUES ($1, $2, $3)", [contact_id, label[index], phone[index]])  
 #    end
 #  end

	# # def self.update(id, contact_id, firstname, lastname, email)
	# # 	pg_result = @@conn.exec_params("UPDATE phones SET contact_id=$1, label=$2, phone_number=$3 WHERE id=$4", [contact_id, label[0], phone[0], id])  	
	# # end
end