class PasswordMailer < ApplicationMailer
  def reset
    @token = params[:user].signed_id(purpose: "reset_password", expires_in: 15.minutes)
    mail to: params[:user].email
  end
end
