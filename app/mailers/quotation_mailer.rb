class QuotationMailer < ApplicationMailer
  default from: "vendaspft10@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.quotation_mailer.quote_requested_confirmation.subject
  #
  def quote_requested_confirmation user, quotation
    @quotation = quotation
    @user = user

    mail to: user.email, subject: "Você tem um cliente querendo cotar um CDB"
  end

end
