class ItemsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.has_role? :superadmin
      @items = Item.all.order(created_at: :desc).paginate(:page => params[:page], per_page: 5).search(params[:search])
    elsif current_user.has_role? :admin
      @items = Item.where(menu_id: current_user.chain.menus.first.id).order(created_at: :desc).paginate(:page => params[:page], per_page: 5).search(params[:search])
    end
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new #new record
  	@item = Item.new
  	
  end	

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to items_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@item = Item.find(params[:id])
  end  

  def update
  	@item = Item.find(params[:id])
  	if @item.update_attributes(item_params)
  		redirect_to items_path
  	else
  		render 'new'
  	end
  end

  def destroy
  		@item = Item.find(params[:id])
  		@item.destroy
  		redirect_to items_path
  end

  private
    def item_params    
      params.require(:item).permit(:name, :description, :price, :menu_id, :item_image)
    end 


end
