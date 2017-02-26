module Api
  module V1
    class ChainsController < ApiController
      respond_to :json
      
      def index
        if params[:mall_id].nil?
          @chains = Chain.all
        else 
          @chains = Chain.where(mall_id: params[:mall_id])
        end
          render json: @chains
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