module Api
  module V1
    class MallsController < ApiController
      respond_to :json
      
      def index
        respond_with Mall.all
      end
      def new
      end
      def show
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