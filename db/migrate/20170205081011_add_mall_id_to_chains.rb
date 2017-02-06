class AddMallIdToChains < ActiveRecord::Migration
  def change
  	add_column :chains, :mall_id, :integer
 
  end
end
