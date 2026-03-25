class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(content: params[:message][:content], user: current_user)

    if @message.save
      redirect_to chat_path(@chat)
    else
      redirect_to chat_path(@chat), alert: "Mensagem não pode ser vazia."
    end
  end
end
