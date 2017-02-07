class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
    
    def new
        @user = User.new
    end

    def create
        user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation )
        @user = User.new user_params
        if @user.save
            sign_in @user
            redirect_to root_path, notice: "Thank you for signing up!"
        else
            render :new
        end
    end
end
