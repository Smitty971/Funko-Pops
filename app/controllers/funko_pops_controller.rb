class FunkoPopsController < ApplicationController
    before_action :current_user, only: [:new, :edit, :delete, :create] 

    def index
        @funko_pops = current_user.funko_pops
    end

    def all_funko_pops
        @funko_pops = FunkoPop.ordered
    end

    def show
        @funko_pop = FunkoPop.find(params[:id])
        @comments = @funko_pop.comments.order('created_at DESC')
        #exitbinding.pry
        #redirect_to funko_pop_path(@funko_pop)
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
            redirect_to funko_pop_path(@funko_pop), notice: "#{@funko_pop.title}, has been created"
        else
            render :new
        end
    end

    

    def edit
         @funko_pop = FunkoPop.find(params[:id])
    end

    def update
        @funko_pop = FunkoPop.find(params[:id])
        if @funko_pop.update(funko_pops_params)
            flash.notice = "The FunkoPop has been updated!"
            redirect_to funko_pop_path(@funko_pop)
        else
          render :edit
        end
    end

    def users_funko_pop
        @user_id = current_user.id
        @funko_pop = FunkoPop.users_funko_pop(@user_id).ordered 
      end


    def destroy
        @funko_pop = FunkoPop.find(params[:id])
        flash.notice = "'#{@funko_pop.title}' has been deleted!"
        @funko_pop.destroy
        redirect_to funko_pops_path
    end
 
    private



    def funko_pops_params
        params.require(:funko_pop).permit(:series, :price, :title, :tag_list, :description, :user_id, :image)
    end
end
