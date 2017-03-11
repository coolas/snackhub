class Item < ActiveRecord::Base
	resourcify
	attr_accessor :item_image
	
	belongs_to :menu
	has_many :orders, through: :order_item
	has_many :order_items
	mount_uploader :item_image, ChainLogoUploader
end
