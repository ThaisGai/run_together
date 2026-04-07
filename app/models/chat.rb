class Chat < ApplicationRecord
  belongs_to :run, optional: true
  belongs_to :sender, class_name: "User", optional: true
  belongs_to :receiver, class_name: "User", optional: true

  has_many :messages, dependent: :destroy

  validates :sender_id, uniqueness: { scope: :receiver_id }, if: -> { run_id.nil? }

  def self.between(user_a, user_b)
    where(sender: user_a, receiver: user_b)
      .or(where(sender: user_b, receiver: user_a))
      .first || create!(sender: user_a, receiver: user_b)
  end

  def group?
    run_id.present?
  end

  def other_user(current_user)
    current_user == sender ? receiver : sender
  end
end
