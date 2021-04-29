class RoomsController < ApplicationController
  
  def show
    @messages = Message.all
  end

  def create
    message = Message.create! content: params[:message]
    ActionCable.server.broadcast 'room_channel', message: message.template
  end
end
