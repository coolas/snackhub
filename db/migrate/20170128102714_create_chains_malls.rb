class CreateChainsMalls < ActiveRecord::Migration
  def change
    create_table :chains_malls do |t|
      t.integer :chain_id
      t.integer :mall_id
      
      t.timestamps null: false
    end
  end
end
