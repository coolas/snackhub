class ReportsController < ApplicationController
	def index  
		if current_user.has_role? :superadmin
			@chains = Chain.find(params[:selected_chain]).all
		elsif current_user.has_role? :admin	
			@chain = Chain.find(current_user.chain_id)
			@selected_date = params[:selected_date]
			@selected_chain = params[:selected_chain]
	end
	end
end
	@chain = Chain.find(params[:id])