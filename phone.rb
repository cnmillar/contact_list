require 'pry'
require 'active_record'

class Phone < ActiveRecord::Base

	belongs_to :contact
	validates :phone_number, presence: true

	def to_s
		"#{label}: #{phone_number}"
	end

end