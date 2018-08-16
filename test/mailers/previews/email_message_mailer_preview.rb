# Preview all emails at http://localhost:3000/rails/mailers/email_message_mailer
class EmailMessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_message_mailer/email_message_confirmation
  def email_message_confirmation
    EmailMessageMailer.email_message_confirmation
  end

end
