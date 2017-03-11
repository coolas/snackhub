class AddRemarksAndContactNumberToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :remarks, :string
  	add_column :orders, :contact_number, :string
  end
end
