class CommentsController < ApplicationController

    def new
        @funko_pop = FunkoPop.find(params[:funko_pop_id]) 
        @comment = @funko_pop.comments.new
        flash.keep(notice)
    end

    def create
        @funko_pop = FunkoPop.find(params[:funko_pop_id]) 
        @comment = @funko_pop.comments.new(comment_params)
        if @comment.save 
            @comment.user_id = current_user.id
            redirect_to user_funko_pop_path(@funko_pop.user, @funko_pop), notice: "Your comment has been added!"
        else
            flash[:notice] = "You need to have both a username and description."
            render :new
            
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:username, :description)
    end
end
