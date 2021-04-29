class Message < ApplicationRecord

  # メッセージを保存した自分自身をパーシャルに挿入してhtmlに変換する
  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end 
end
