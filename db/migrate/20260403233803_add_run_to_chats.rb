class AddRunToChats < ActiveRecord::Migration[7.1]
  def change
    add_reference :chats, :run, null: true, foreign_key: true
  end
end
