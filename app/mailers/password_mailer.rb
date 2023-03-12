class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @token = params[:user].signed_id(purpose: "reset_password", expires_in: 15.minutes)
    mail to: params[:user].email

    # @greeting = "Hi"
    # mail to: "to@example.org"
  end
end
