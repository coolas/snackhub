class AddImageLogoToChains < ActiveRecord::Migration
  def change
  	add_column :chains, :chain_logo, :string
  end
end
