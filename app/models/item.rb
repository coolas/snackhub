class Item < ActiveRecord::Base
	resourcify
	
	belongs_to :menu
	has_many :orders, through: :order_item
	has_many :order_items

end
