class AddLocationIdToMalls < ActiveRecord::Migration
  def change
  	add_column :malls, :location_id, :integer
  	add_index :malls, :location_id
  end
end
