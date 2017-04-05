class AddAmountBalanceInChains < ActiveRecord::Migration
  def change
  	add_column :chains, :amount_balance, :float
  end
end
