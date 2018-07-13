class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  # hook方法：会在新生成一个Notification时执行job。
  # 比如点击一个create按键：“建立连接”：
  # 之后会出现这个信息。
  after_commit -> { NotificationRelayJob.perform_later(self)}
end
