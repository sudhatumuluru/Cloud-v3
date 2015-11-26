# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/notify_complete
  def notify_complete
    Notification.notify_complete
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification/notify_incomplete
  def notify_incomplete
    Notification.notify_incomplete
  end

end
