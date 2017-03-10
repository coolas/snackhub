module Api
  module V1
    class OrdersController < ApiController
      respond_to :json
      
      def index
        respond_with Order.all
      end
      def new
      end
      def show
        @order = Order.find(params[:id])
        render json: @order, root: false
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