require './setup'

ActiveRecord::Schema.define do
  drop_table :phones if ActiveRecord::Base.connection.table_exists?(:phones)
  drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
  
  create_table :contacts do |t|
    t.column :firstname, :string
    t.column :lastname, :string
    t.column :email, :string
  end
  create_table :phones do |table|
    table.references :contacts
    table.column :contact_id, :integer
    table.column :phone_number, :string
    table.column :label, :string
  end
end
