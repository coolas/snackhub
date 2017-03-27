class Item < ActiveRecord::Base
	resourcify
	attr_accessor :item_image
	
	belongs_to :menu
	has_many :orders, through: :order_item
	has_many :order_items
	mount_uploader :item_image, ChainLogoUploader

	 def self.search(search)
  		@items = Item.all
   		@items = where(['description LIKE :search OR price LIKE :search OR name LIKE :search', search: "%#{search}%"])
 	 end
end

