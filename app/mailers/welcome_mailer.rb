class WelcomeMailer < ApplicationMailer

  def send_greetings_notification(admin_user)
    @admin_user = admin_user

    mail to: @admin_user, subject: "Thankyou for Signin on our site"
  end
end
