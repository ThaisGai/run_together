class RunMember < ApplicationRecord
  belongs_to :user
  belongs_to :run

  validates :user_id, uniqueness: { scope: :run_id, message: "já está participando desta corrida" }
end
