module Api
  module V1
    class ItemsController < ApiController
      respond_to :json
      
      def index
        if params[:menu_id].nil?
          @items = Item.all
        else 
          @items = Item.where(menu_id: params[:menu_id])
        end
          render json: @items
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