class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to rooms_index_path
        else
            render :new
        end
    end

    def show
        @user = User.find_by(params[:id])
    end

    def change_avatar
        @user = current_user
        @user.avatar.purge
        @user.avatar.attach(params[:avatar])
        redirect_to rooms_index_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :avatar, :email)
    end

end