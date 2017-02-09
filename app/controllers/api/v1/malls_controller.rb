module Api
  module V1
    class MallsController < ApiController
      respond_to :json
      
      def index
        respond_with Mall.all
      end
      def show
        respond_with Mall.find(params[:id])
      end
     
      def create
        respond_with Mall.create(params[:mall])
      end
     
      def update
        respond_with Mall.update(params[:id], params[:mall])
      end

      def destroy
        respond_with Mall.destroy(params[:id])
      end
    end
  end
end