class CommentsController < ApplicationController

    def create
        @funko_pop = FunkoPop.find(params[:funko_pop_id]) 
        @comment = @funko_pop.comments.create(comment_params)
        @comment.user_id = current_user.id
        redirect_to user_funko_pop_path(@funko_pop.user, @funko_pop), notice: "Your comment has been added!"
    end

    private

    def comment_params
        params.require(:comment).permit(:username, :description)
    end
end
