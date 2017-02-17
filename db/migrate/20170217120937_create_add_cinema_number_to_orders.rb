class CreateAddCinemaNumberToOrders < ActiveRecord::Migration
  def change
    create_table :add_cinema_number_to_orders do |t|
    add_column :orders, :cinema_number, :string
      t.timestamps null: false
    end
  end
end
