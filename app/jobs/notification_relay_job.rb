class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # 解释："notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}",
    # notification记录里的notifiable_type属性的值是User。这个值是默认生成的，
    # 原因是这个：belongs_to :notifiable, polymorphic: true
    # 然后underscore小写，然后pluralize改复数形态。
    # action的值，就是文件_followed.html.erb中的“followed”
    html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}",
      locals: {notification: notification}, formats:[:html]
    ActionCable.server.broadcast("notifications:#{notification.recipient_id}", {html: html})
  end
end
