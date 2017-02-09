module Api
  module V1
    class ApiMalls < ApiController
      respond_to :json
      
      def index
        respond_with ApiMall.all
      end
      def show
        respond_with ApiMall.find(params[:id])
      end
     
      def create
        respond_with ApiMall.create(params[:apimall])
      end
     
      def update
        respond_with ApiMall.update(params[:id], params[:apimall])
      end

      def destroy
        respond_with ApiMall.destroy(params[:id])
      end
    end
  end
end