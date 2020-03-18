class SessionsController < ApplicationController

    #test

    def new
    end
  
    def create
      if request.env["omniauth.auth"]
        @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
          if @user.nil?
            @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: "github")
          end
            log_in(@user)
            redirect_to funko_pops_path
         else
            @user = User.find_by(username: params[:username])
         if !@user
            flash.notice = "Account not found. Please try again."
            render :new
         elsif !@user.authenticate(params[:password])
            flash.notice = "Password incorrect. Please try again."
            render :new
         else
            log_in(@user)
            redirect_to funko_pops_path
         end
      end
    end
  
    def destroy
      session.clear
      redirect_to root_path
    end
end