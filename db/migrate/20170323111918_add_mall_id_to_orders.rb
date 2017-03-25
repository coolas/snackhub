class AddMallIdToOrders < ActiveRecord::Migration
  def change
  		add_column :orders, :mall_id, :integer
  		add_index :orders, :mall_id
  end
end
