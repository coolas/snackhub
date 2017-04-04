class Card < ActiveRecord::Base

 def generate_card_card_number
    self.card_number = Digest::SHA1.hexdigest([Time.now, rand].join)[0..10]
    self.save!
 end
 after_create :generate_card_card_number
end
