class RoomChannel < ApplicationCable::Channel

  # クライアントがサーバーに接続すると実行される
  def subscribed
    # room_channel.rbとroom_channel.js間でデータの送受信をできるようにする
    stream_from "room_channel"
    5.times { puts '*****TEST****'}
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # room_channel.jsのspeakからメッセージを受け取ってDBに保存
  def speak(data)
    message = Message.create! content: data['message']

    # 保存したメッセージをhtmlに変換してroom_channel.jsにブロードキャスト
    ActionCable.server.broadcast 'room_channel', message: message.template
  end
end
