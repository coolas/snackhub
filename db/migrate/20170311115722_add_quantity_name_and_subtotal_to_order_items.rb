class AddQuantityNameAndSubtotalToOrderItems < ActiveRecord::Migration
  def change
  	add_column :order_items, :quantity, :integer
  	add_column :order_items, :Name, :string
  	add_column :order_items, :subtotal, :float
  end
end
