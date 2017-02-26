class AddMenuIdToItems < ActiveRecord::Migration
  def change
  	add_column :items, :menu_id, :integer
  	add_index :items, :menu_id
  end
end
