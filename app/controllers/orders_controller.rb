class OrdersController < ApplicationController

  def index
    @orders = Order.all
    #respond_to do |format|
     #format.html
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new #new record
  	@order = Order.new
  end	

  def create
  	@order = Order.new(order_params)
  	if @order.save
  		redirect_to orders_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@order = Order.find(params[:id])
  end  

  def update
  	@order = Order.find(params[:id])
  	if @order.update_attributes(order_params)
  		redirect_to orders_path
  	else
  		render 'new'
  	end
  end

  def destroy
  		@order = Order.find(params[:id])
  		@order.destroy
  		redirect_to orders_path
  end

  private
    def order_params    
      params.require(:order).permit(:total, :reference_number, :user_id)
    end 


end
