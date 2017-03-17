class AddChainIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :chain_id, :integer
  	add_index :orders, :chain_id
  end
end
