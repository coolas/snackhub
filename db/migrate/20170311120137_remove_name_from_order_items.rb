class RemoveNameFromOrderItems < ActiveRecord::Migration
  def change
  	remove_column :order_items, :Name
  end
end
