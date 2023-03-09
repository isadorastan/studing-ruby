class SessionsController < ApplicationController
    def new 
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged In"
        else
            flash[:alert] = "Invalid email or password"
            render :new, status: 422
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to sign_in_path, notice: "Logged Out"
    end
end
