# メッセージを受け取りバックグラウンドで処理する役割

class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # 
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private
    # partialの_message.html.erbを呼び出す
    # メッセージも渡す
    def render_message(message)
      # ApplicationController.renderer()はアクションの制約を受けずにveiwをレンダリングできる
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
