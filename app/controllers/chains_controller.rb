class ChainsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @chains = Chain.all
    #respond_to do |format|
     #format.html
  end

  def show
  	@chain = Chain.find(params[:id])
  end

  def new #new record
    @chain = Chain.new
    if current_user.has_role? :admin
      if !current_user.chain_id.nil?
      	redirect_to new_menu_path
      end
    end
  	
  end	

  def create
  	@chain = Chain.new(chain_params)
  	if @chain.save
  		if current_user.has_role? :superadmin
  			redirect_to chains_path
  		elsif current_user.has_role? :admin
  			current_user.update_attributes(chain_id: @chain.id)
  			redirect_to new_menu_path
  		end
  	else
  		render 'new'
  	end
  end

  def edit
  	@chain = Chain.find(params[:id])
  end  

  def update
  	@chain = Chain.find(params[:id])
  	if @chain.update_attributes(chain_params)
  		redirect_to chains_path
  	else
  		render 'new'
  	end
  end

  def destroy
  		@chain = Chain.find(params[:id])
  		@chain.destroy
  		redirect_to chains_path
  end

  private
    def chain_params    
      params.require(:chain).permit(:name, :mall_id)
    end 

end
