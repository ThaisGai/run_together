class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  scope :unread_for, ->(user) { where.not(user: user).where(read_at: nil) }
end
