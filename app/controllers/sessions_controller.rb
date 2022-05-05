class SessionsController < ApplicationController
    #Sessions are used to identify users after they have logged in, currently the number 
    #to choose how many messages to display is saved in the users session.
    #generates when given a valid email password combination, otherwise it stays on the login page and displays an error.
    def create
        @user = User.find_by(email: params[:email])
        if !!@user && @user.authenticate(params[:password])

            session[:user_id] = @user.id
            redirect_to rooms_index_path
        else
            message = "Something went wrong. Make sure the username and password are correct"
            redirect_to login_path, notice: message
        end
    end
    
    #Destroys the session, logging the user off. 
    def destroy
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_path
    end
end