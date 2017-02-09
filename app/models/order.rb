class Order < ActiveRecord::Base

	has_many :items, through: :order_items
	has_many :order_items
	belongs_to :user
	

def generate_order_reference_number
    self.reference_number = Digest::SHA1.hexdigest([Time.now, rand].join)[0..10]
    self.save!
  end
after_create :generate_order_reference_number

end

