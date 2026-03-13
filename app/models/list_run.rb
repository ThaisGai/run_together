class ListRun < ApplicationRecord
  belongs_to :user
  has_many :run_members, dependent: :destroy
  has_many :members, through: :run_members, source: :user
  has_one :chat, dependent: :destroy

  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :pace, presence: true

  scope :public_runs, -> { where(private: false) }
  scope :upcoming, -> { where("date >= ?", Date.today).order(:date, :time) }
end
