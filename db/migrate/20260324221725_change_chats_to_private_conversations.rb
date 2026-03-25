class ChangeChatsToPrivateConversations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :chats, :run, foreign_key: true
    add_reference :chats, :sender, foreign_key: { to_table: :users }, null: false
    add_reference :chats, :receiver, foreign_key: { to_table: :users }, null: false
    add_index :chats, [:sender_id, :receiver_id], unique: true
  end
end
