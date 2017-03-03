class LocationsController < ApplicationController
 load_and_authorize_resource
 
 def index
    @locations = Location.all
    #respond_to do |format|
     #format.html
  end

  def show
  	@location = Location.find(params[:id])
  end

  def new #new record
  	@location = Location.new
  end	

  def create
  	@location = Location.new(location_params)
  	if @location.save
  		redirect_to locations_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@location = Location.find(params[:id])
  end  

  def update
  	@location = Location.find(params[:id])
  	if @location.update_attributes(location_params)
  		redirect_to locations_path
  	else
  		render 'new'
  	end
  end

  def destroy
  		@location = Location.find(params[:id])
  		@location.destroy
  		redirect_to locations_path
  end

  private
    def location_params    
      params.require(:location).permit(:province)
    end 

end
