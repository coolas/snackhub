class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_number
      t.float :amount

      t.timestamps null: false
    end
  end
end
