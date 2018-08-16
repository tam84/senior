require 'test_helper'

class QuotationMailerTest < ActionMailer::TestCase
  test "quote_requested_confirmation" do
    mail = QuotationMailer.quote_requested_confirmation
    assert_equal "Quote requested confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
