class ReportsController < ApplicationController
	def index
		@chain = Chain.find(current_user.chain_id)
	end
end
