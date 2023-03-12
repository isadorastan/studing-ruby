class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present? 
            # send  email    
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path, notice: "If an account with this email was found, we have sent a link to reset your password"
    end

    def edit 
        @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Your token has expired. Please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in"
        else
            render :edit, status: :bad_request
        end
    end

    def password_params
        params.required(:user).permit(:password, :password_confirmation)
    end 
end
