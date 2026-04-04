class MakeChatsSenderReceiverOptional < ActiveRecord::Migration[7.1]
  def change
    change_column_null :chats, :sender_id, true
    change_column_null :chats, :receiver_id, true
  end
end
