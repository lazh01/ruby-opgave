class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])

            session[:user_id] = @user.id
            redirect_to rooms_index_path
        else
            message = "Something went wrong. Make sure the username and password are correct"
            redirect_to login_path, notice: message
        end
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_path
    end
end