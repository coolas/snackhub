module Api
  module V1
    class LocationsController < ApiController
      respond_to :json
      
      def index
        respond_with Location.all
      end
      def new
      end
      def show
        @location = Location.find(params[:id])
        render json: @location, root: false
      end
     
      def create
      end
     
      def update
      end

      def destroy
       
      end
    end
  end
end