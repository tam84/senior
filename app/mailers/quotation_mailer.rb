class QuotationMailer < ApplicationMailer
  default from: "vendaspft10@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.quotation_mailer.quote_requested_confirmation.subject
  #
  def quote_requested_confirmation receiver_user, senter_user, quotation
    @quotation = quotation
    @receiver_user = receiver_user
    @senter_user = senter_user

    mail to: @receiver_user.email, subject: "Você tem um cliente querendo cotar um CDB"
  end

end
