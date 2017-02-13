module Api
  module V1
    class MenusController < ApiController
      respond_to :json
      
      def index
        respond_with Menu.all
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