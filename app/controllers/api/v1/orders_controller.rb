module Api
  module V1
    class OrdersController < ApiController
      respond_to :json
      
      def index
        if params[:user_id].nil?
          @orders = Order.all
        else 
          @orders = Order.where(user_id: params[:user_id])
        end
        render json: @orders
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
        params.require(:order).permit(:total, :reference_number, :user_id, :contact_number, :cinema_number, :remarks)
      end
    end
  end
end