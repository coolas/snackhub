class AddAddressToMalls < ActiveRecord::Migration
  def change
  		add_column :malls, :address, :text
  end
end
