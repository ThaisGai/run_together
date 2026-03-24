class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = current_user.chats.includes(:sender, :receiver, :messages)
  end

  def show
    @chat = Chat.between(current_user, User.find(params[:id]))
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = Message.new
  end
end
