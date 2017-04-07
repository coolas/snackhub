module Api
  module V1
    class RedemptionsController < ApiController
      respond_to :json
      
      def index
        if params[:user_id].nil?
          @redemptions = Redemption.all
        else 
          @redemptions = Redemption.where(user_id: params[:user_id])
        end
        render json: @redemptions
      end

      def new
      end
      def show
        @redemption = Redemption.find(params[:id])
        render json: @redemption
      end
     
      def create
        @redemption = Redemption.new(redemption_params)
        @card = Card.where(card_number: @redemption.card_number).first
        if @card.is_redeemed.nil?
            if @redemption.save
              render json: @redemption, status: :created, root: false
            else
              render json: @redemption.errors, status: :unprocessable_entity
            end
        else
           render json: @redemption.errors, status: :unprocessable_entity
        end
      end
     
      def update
      end

      def destroy
       
      end

      private

      def redemption_params
        params.require(:redemption).permit(:user_id, :card_id, :card_number)
      end
    end
  end
end