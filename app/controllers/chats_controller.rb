class ChatsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

 def index
  @chats = current_user.chats
    # .left_joins(:messages) (para mostrar mensagens sem mensagens)
    .joins(:messages)
    .select("chats.*, MAX(messages.created_at) AS last_message_time")
    .group("chats.id")
    .order("last_message_time DESC NULLS LAST")
 end

def show
  @chat = Chat.find(params[:id])
  @messages = @chat.messages.includes(:user).order(:created_at)
  @message = Message.new

  # Marca mensagens como lidas
  @chat.messages.unread_for(current_user).update_all(read_at: Time.current)
  end


  def with_user
    other_user = User.find(params[:user_id])
    @chat = Chat.between(current_user, other_user)
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = Message.new

    @chat.messages.unread_for(current_user).update_all(read_at: Time.current)

    render :show
  end
end
