class AddChainIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :chain_id, :integer
  end
end
