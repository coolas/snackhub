class ReportsController < ApplicationController
	def index
		@user = User.find(current_user.id)  
		if current_user.has_role? :superadmin
			@chains = Chain.all
			if params[:selected_date].nil?
				@selected_date = '2017/03/01'
			else
				@selected_date = params[:selected_date]
			end

			if params[:selected_chain_id].nil?
				@selected_chain = 1
			else
				@selected_chain = params[:selected_chain_id]
			end

		elsif current_user.has_role? :admin	
			@chain = Chain.find(current_user.chain_id)
			if params[:selected_date].nil?
				@selected_date = '2017/03/01'
			else
				@selected_date = params[:selected_date]
			end
			@selected_chain = current_user.chain_id
		end
	end
end