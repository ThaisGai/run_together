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
    Chat.where(sender: self).or(Chat.where(receiver: self))
  end
end
