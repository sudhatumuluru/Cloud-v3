require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "notify_complete" do
    mail = Notification.notify_complete
    assert_equal "Notify complete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_incomplete" do
    mail = Notification.notify_incomplete
    assert_equal "Notify incomplete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
