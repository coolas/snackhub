class MallsController < ApplicationController


  def index
    @malls = Mall.all
    #respond_to do |format|
     #format.html
  end

  def show
  	@mall = Mall.find(params[:id])
  end

  def new #new record
  	@mall = Mall.new
  end	

  def create
  	@mall = Mall.new(mall_params)
  	if @mall.save
  		redirect_to malls_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@mall = Mall.find(params[:id])
  end  

  def update
  	@mall = Mall.find(params[:id])
  	if @mall.update_attributes(mall_params)
  		redirect_to malls_path
  	else
  		render 'new'
  	end
  end

  def destroy
  		@mall = Mall.find(params[:id])
  		@mall.destroy
  		redirect_to malls_path
  end

  private
    def mall_params    
      params.require(:mall).permit(:name, :address)
    end 

end

