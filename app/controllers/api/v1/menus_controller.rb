module Api
  module V1
    class MenusController < ApiController
      respond_to :json
      
      def index
        if params[:chain_id].nil?
          @menus = Menu.all
        else 
          @menus = Menu.where(chain_id: params[:chain_id])
        end
        render json: @menus
      end
      def new
      end
      def show
        @menu = Menu.find(params[:id])
        render json: @menu, root: false
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