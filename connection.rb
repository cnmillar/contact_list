class Connection
	  # Open connection to locally hosted contacts database
  def self.connect
		begin
		  @@conn = PG.connect(
				:dbname => 'contacts'
		  )
		rescue PG::ConnectionBad
		  puts "Sorry, there is something wrong with your credentials"
		end
		@@conn
  end

  def self.disconnect
  	@@conn.close
  end

end