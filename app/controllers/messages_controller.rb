class MessagesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

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
