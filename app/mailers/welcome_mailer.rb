class WelcomeMailer < ApplicationMailer

  def welcome_email(email)
    @email = email

    mail(
      to: email.email,
      subject: "Welcome to hrsurvival!"
      )
  end
end
