class FunkoPopsController < ApplicationController
    before_action :current_user, only: [:new, :edit, :delete, :create] 

    def index
        @funko_pops = FunkoPop.all
    end

    def show
        @funko_pop = FunkoPop.find(params[:id])
        redirect_to funko_pop_path(@funko_pop)
        #binding.pry
        #nested forms 
        #@comment = @funkopop.comments.build
        #@comment = Comment.new
        #@comment.funkopops.id = @funko_pop.id
    end

    def new
        @funko_pop = FunkoPop.new

    end

    def create
        @funko_pop = @current_user.funko_pops.build(funko_pops_params)
        if @funko_pop.save
            binding.pry
            redirect_to funko_pop_path(@funko_pop)
        else
            render :new
        end
    end

    

    def edit
         @funko_pop = FunkoPop.find(params[:id])
    end

    def update
        @funko_pop = FunkoPop.find(params[:id])
        if authorize(@funko_pop)
        @funko_pop.update(funko_pops_params)
        flash.notice = "'#{@funko_pops.title}' has been update!"
        redirect_to funko_pop_path(@funko_pop)
        else
          render :edit
        end
    end

    def destroy
        @funko_pop = FunkoPop.find(params[:id])
        @funko_pop.destroy
        flash.notice = "'{funkopop.title}' has been deleted!"
        redirect_to funko_pops_path
    end
 
    private



    def funko_pops_params
        params.require(:funko_pop).permit(:series, :price, :title, :description, :user_id, :image)
    end
end
