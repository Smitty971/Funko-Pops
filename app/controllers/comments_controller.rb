class CommentsController < ApplicationController

    def create 
        @comment = Comment.new(comment_params)
        @comment.funko_pop_id = params [:book_id]
        @comment.save
        flash.notice = "Your comment has been added!"
        redirect_to book_path(@comment.funko_pop)
    end

    private

    def comment_params
        params.require(:comment).permit(:username, :description)
    end
end
