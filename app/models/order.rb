class Order < ActiveRecord::Base

	has_many :items, through: :order_items
	has_many :order_items, dependent: :destroy
	belongs_to :user


	

 def generate_order_reference_number
    self.reference_number = Digest::SHA1.hexdigest([Time.now, rand].join)[0..10]
    self.save!
 end
 after_create :generate_order_reference_number

 def self.search(search)
  	@orders = Order.all
    @orders = where(['cinema_number LIKE :search OR remarks LIKE :search OR contact_number LIKE :search OR reference_number LIKE :search', search: "%#{search}%"])
 
 end

 def mall
 	if self.mall_id.nil?
 		nil
 	else
 		Mall.find(self.mall_id).name
 	end
 end

 def chain
 	if self.chain_id.nil?
 		nil
 	else
 		Chain.find(self.chain_id).name
 	end
 end

end

