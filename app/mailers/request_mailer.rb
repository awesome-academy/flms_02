class RequestMailer < ApplicationMailer
  def request_email request
    @request = request
    mail to: @request.user_email, subject: t("feedback")
  end

  def delete_user user
    @user = user
    mail to: @user.email, subject: t("feedback")
  end
end
