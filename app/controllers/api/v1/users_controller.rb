module Api
  module V1
    class UsersController < ApiController
      respond_to :json
      
      def index
        if params[:user_id].nil?
          @users = User.all
        else 
          @users = User.where(user_id: params[:user_id])
        end
        render json: @users
      end

      def new
      end
      def show
        @user = User.find(params[:id])
        render json: @user
      end
     
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created, root: false
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
     
      def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          render json: @user
        end
      end

      def destroy
       
      end

      private

      def user_params
        params.require(:user).permit(:account_balance)
      end
    end
  end
end