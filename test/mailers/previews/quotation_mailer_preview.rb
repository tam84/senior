# Preview all emails at http://localhost:3000/rails/mailers/quotation_mailer
class QuotationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/quotation_mailer/quote_requested_confirmation
  def quote_requested_confirmation
    QuotationMailer.quote_requested_confirmation
  end

end
