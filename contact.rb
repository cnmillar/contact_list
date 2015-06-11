require 'pg'
require 'pry'
require 'active_record'    

class Contact < ActiveRecord::Base

  has_many :phones

  def to_s
    "#{id}: #{firstname} #{lastname}, #{email}, #{phone_string}"
  end

  def phone_string
    phones.map(&:to_s).join(', ')
  end

end
