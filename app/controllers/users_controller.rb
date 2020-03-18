class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to funko_pops_path
        else
            render :new
        end
    end


    private

    def user_params
       params.require(:user).permit(:username, :email, :password, :comment_id)
    end
end
