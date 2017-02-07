class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total
      t.string :reference_number

      t.timestamps null: false
    end
  end
end
