class AddIsRedeemedToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :is_redeemed, :boolean
  end
end
