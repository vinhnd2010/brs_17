class RequestMailer < ApplicationMailer
  def acception_request request
    @request = request
    @user = @request.user
    mail to: @user.email, subject: t("email.subject.request")
  end
end
