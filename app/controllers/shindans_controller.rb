class ShindansController < ApplicationController
        def index
        end
      
        def new
          @shindan = Shindan.new
        end
      
        def show
          @shindan = Shindan.find_by(id: params[:id])
        end
      
        def create
          @shindan = Shindan.new(shindans_params)
          params[:shindan][:question] ? @shindan.question = params[:shindan][:question].join("") : false
          if @shindan.save
              flash[:notice] = "診断が完了しました"
              redirect_to shindan_path(@shindan.id)
          else
              redirect_to :action => "new"
          end
        end
      
      private
        def shindans_params
            params.require(:shindan).permit(:id, question: [])
        end

      

end
