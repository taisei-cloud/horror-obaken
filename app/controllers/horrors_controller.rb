class HorrorsController < ApplicationController
    def index
        @horrors = Horror.all

        if params[:tag_ids]
          @horrors = []
          params[:tag_ids].each do |key, value|      
            @horrors += Tag.find_by(name: key).horrors if value == "1"
          end
          @horrors.uniq!
        end

    end

    def new
        @horror = Horror.new
      end
    
      def create
        horror = Horror.new(horror_params)
        if horror.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      
      def show
        @horror = Horror.find(params[:id])    
      end
      
      def destroy
        horror = Horror.find(params[:id])
        horror.destroy
        redirect_to action: :index
      end
        private
      def horror_params
        params.require(:horror).permit(:name, :address, :difficult, :about, :image, tag_ids:[])
      end
end
