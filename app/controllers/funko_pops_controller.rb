class FunkoPopsController < ApplicationController
    before_action :current_user, only: [:new, :edit, :delete, :create] 

    def index
        @funkopops = FunkoPop.all
    end

    def show
        @funkopop = FunkoPop.find(params[:id])
        #nested forms 
        #@comment = @funkopop.comments.build
        @comment = Comment.new
        @comment.funko_pops_id = @funkopop.id
    end

    def new
        @funkopop = FunkoPop.new

    end

    def create
        #binding.pry
        @funkopop = @current_user.funko_pop.build(funko_pops_params)
        @funkopop.user_id = @current_user.id
        if @funkopop.save
            redirect_to funko_pop_path(@funkopop)
        else
            render :new
        end
    end

    

    def edit
         @funkopop = FunkoPop.find(params[:id])
    end

    def update
        @funkopop = FunkoPop.find(params[:id])
        if authorize(@funkopop)
        @funkopop.update(funko_pops_params)
        flash.notice = "'#{@funkopops.title}' has been update!"
        redirect_to funko_pop_path(@funkopops)
        else
          render :edit
        end
    end

    def destroy
        @funkopop = FunkoPop.find(params[:id])
        @funkopop.destroy
        flash.notice = "'{funkopop.title}' has been deleted!"
        redirect_to funko_pops_path
    end
 
    private



    def funko_pops_params
        params.require(:funkopop).permit(:series, :price, :title, :description, :user_id, :image)
    end
end
