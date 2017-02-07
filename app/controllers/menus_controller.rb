class MenusController < ApplicationController
def index
    @menus = Menu.all
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
