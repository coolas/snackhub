class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
    	
      t.timestamps null: false
    end
  end
end
