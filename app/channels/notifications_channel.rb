class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # 当你加入频道，你只会收到你的通知。当创建一个订阅后，从客户端向服务器端传参数
    stream_from "notifications:#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  # 转播一条消息：从一个客户发信息到另一个连接的客户（所有连接的客户都能收到，包括自己）
  # 参数和stream_from（参数）你订阅的频道一样。
  # def receive(data)
  #   ActionCable.server.broadcast "notifications:#{current_user.id}", {html: data}
  # end

end
