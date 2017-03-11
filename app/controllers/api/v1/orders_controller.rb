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
        @order = Order.new(order_params)
        if @order.save
          render json: @order, root: false
        else
          
        end
      end
     
      def update
      end

      def destroy
       
      end
    end
  end
end