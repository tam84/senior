require 'test_helper'

class EmailMessageMailerTest < ActionMailer::TestCase
  test "email_message_confirmation" do
    mail = EmailMessageMailer.email_message_confirmation
    assert_equal "Email message confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
