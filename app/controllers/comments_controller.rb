class CommentsController < ApplicationController

    def create 
        @comment = Comment.new(comment_params)
        binding.pry
        @comment.funkopops.id = params [:funkopops_id]
        @comment.save
        flash.notice = "Your comment has been added!"
        redirect_to funko_pop_path(@comment.funko_pop)
    end

    private

    def comment_params
        params.require(:comment).permit(:username, :description)
    end
end
