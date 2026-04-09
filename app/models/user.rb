class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :runs, dependent: :destroy
  has_many :run_members, dependent: :destroy
  has_many :runs_joined, through: :run_members, source: :run
  has_many :messages, dependent: :destroy
  has_many :sent_chats,     class_name: "Chat", foreign_key: :sender_id,   dependent: :destroy
  has_many :received_chats, class_name: "Chat", foreign_key: :receiver_id, dependent: :destroy

  enum gender: { male: 0, female: 1, other: 2 }

def chats
  run_ids = runs.pluck(:id) + runs_joined.pluck(:id)
  Chat.where(sender: self)
      .or(Chat.where(receiver: self))
      .or(Chat.where(run_id: run_ids))
  end

def unread_messages_count
  chat_ids = chats.pluck(:id)
  Message.where(chat_id: chat_ids).unread_for(self).count
  end
end
