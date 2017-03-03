class MenusController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.has_role? :superadmin
      @menus = Menu.all
    elsif current_user.has_role? :admin
      @menus = Menu.where(chain_id: current_user.chain_id)
    end
    #respond_to do |format|
     #format.html
  end

  def show
  	@menu = Menu.find(params[:id])
  end

  def new #new record
  	@menu = Menu.new
  end	

  def create
  	@menu = Menu.new(menu_params)
  	if @menu.save
  		redirect_to menus_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@menu = Menu.find(params[:id])
  end  

  def update
  	@menu = Menu.find(params[:id])
  	if @menu.update_attributes(menu_params)
  		redirect_to menus_path
  	else
  		render 'new'
  	end
  end

  def destroy
  		@menu = Menu.find(params[:id])
  		@menu.destroy
  		redirect_to menus_path
  end

  private
    def menu_params    
      params.require(:menu).permit(:name, :chain_id)
    end 

end
