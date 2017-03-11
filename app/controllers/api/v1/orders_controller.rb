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
          render json: @order, status: :created, root: false
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end
     
      def update
      end

      def destroy
       
      end

      private

      def order_params
        params.require(:order).permit(:total, :reference_number, :user_id)
      end
    end
  end
end