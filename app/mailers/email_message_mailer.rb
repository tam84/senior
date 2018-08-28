class EmailMessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email_message_mailer.email_message_confirmation.subject
  #
  def email_message_confirmation email_message, receiver_user, senter_user
    @email_message = email_message
    @receiver_user = receiver_user
    @senter_user = senter_user

    mail to: @receiver_user.email, subject: "Um cliente está interessado em um de seus produtos"
  end
end
