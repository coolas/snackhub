class AddPaymentMethodInOrders < ActiveRecord::Migration
  def change
  		add_column :orders, :payment_method, :integer
  end
end
