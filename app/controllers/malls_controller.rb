class MallsController < ApplicationController
private
    def mall_params    
      params.require(:mall).permit(:name)
    end
	
  def index
  	@malls = Mall.all
  end

  def new
  	@malls = Mall.new
  	
  end	

  def show
  	@malls = Mall.find(params[:id])
  end

  def create
    @malls = Mall.new(mall_params)
    if @malls.save
      cookies.permanent[:last_mall_id] = @mall.id
      flash[:notice] = "Successfully created Mall."
    end
    respond_with(@mall)
  end

  def update
    @malls = Mall.find(params[:id])
    if @malls.update_attributes(mall_params)
      flash[:notice] = "Successfully updated product."
    end
    respond_with(@mall, :location => mall_url)
  end

   def destroy
    @malls = Mall.find(params[:id])
    @malls.destroy
    flash[:notice] = "Successfully destroyed product."
    respond_with(@malls, :responder => MyResponder)
  end
end
