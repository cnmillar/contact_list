require 'pry' # in case you want to use binding.pry

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contacts',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

# ActiveRecord::Schema.define do
#   drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   drop_table :phones if ActiveRecord::Base.connection.table_exists?(:phones)
  
#   create_table :contacts do |t|
#     t.column :firstname, :string
#     t.column :lastname, :string
#     t.column :email, :string
#   end
#   create_table :employees do |table|
#     table.references :contacts
#     table.column :contact_id, :integer
#     table.column :phone_number, :string
#     table.column :label, :string
#   end
# end

puts 'Setup DONE'
