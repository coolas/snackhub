class Redemption < ActiveRecord::Base

	def credit_amount_to_user_account_balance
		card = Card.where(card_number: self.card_number).first
		self.update_attributes(card_id: card.id)
		user = User.find(self.user_id)
		user.update_attributes(account_balance: user.account_balance + card.amount)
		card.update_attributes(is_redeemed: false)
	end
	after_create :credit_amount_to_user_account_balance


end
