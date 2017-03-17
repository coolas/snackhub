class Order < ActiveRecord::Base

	has_many :items, through: :order_items
	has_many :order_items
	belongs_to :user


	

 def generate_order_reference_number
    self.reference_number = Digest::SHA1.hexdigest([Time.now, rand].join)[0..10]
    self.save!
 end
 after_create :generate_order_reference_number

 def self.search(search)
  	@orders = Order.all
    @orders = where(['cinema_number LIKE ?', "%#{search}"])
    @orders = where(['remarks LIKE ?', "%#{search}%"])
    @orders = where(['contact_number LIKE ?', "%#{search}%"])
    @orders = where(['reference_number LIKE ?', "%#{search}%"])
 
 end


end

