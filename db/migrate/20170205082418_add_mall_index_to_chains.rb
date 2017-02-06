class AddMallIndexToChains < ActiveRecord::Migration
  def change
  	add_index :chains, :mall_id
  end
end
