class AddUserIdCardNumberCardIdtoRedemption < ActiveRecord::Migration
  def change
  	add_column :redemptions, :user_id, :integer
  	add_index :redemptions, :user_id
  	add_column :redemptions, :card_id, :integer
  	add_index :redemptions, :card_id
  	add_column :redemptions, :card_number, :string
  	add_index :redemptions, :card_number

  end
end
