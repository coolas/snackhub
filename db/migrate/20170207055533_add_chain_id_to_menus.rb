class AddChainIdToMenus < ActiveRecord::Migration
  def change
  	add_column :menus, :chain_id, :integer
  	add_index :menus, :chain_id
  end
end
