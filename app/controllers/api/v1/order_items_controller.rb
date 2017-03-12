module Api
  module V1
    class OrderItemsController < ApiController
      respond_to :json
      
      def index
        if params[:order_id].nil?
          @order_items = OrderItem.all
        else 
          @order_items = OrderItem.where(order_id: params[:order_id])
        end
        render json: @order_items
      end

      def new
      end
      def show
        @order_item = OrderItem.find(params[:id])
        render json: @order_item, root: false
      end
     
      def create
        @order_item = OrderItem.new(order_item_params)
        if @order_item.save
          render json: @order_item, status: :created, root: false
        else
          render json: @order_item.errors, status: :unprocessable_entity
        end
      end
     
      def update
      end

      def destroy
       
      end

      private

      def order_item_params
        params.require(:order_item).permit(:item_id, :order_id, :quantity, :name, :subtotal)
      end
    end
  end
end