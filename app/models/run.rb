class Run < ApplicationRecord
  belongs_to :user
  has_many :run_members, dependent: :destroy
  has_many :members, through: :run_members, source: :user
  has_one :chat, dependent: :destroy

  # after_create :create_chat

  validates :date,     presence: true
  validates :time,     presence: true
  validates :location, presence: true
  validates :pace,    presence: true

  scope :public_runs, -> { where(private: false) }
  scope :upcoming,    -> { where("date >= ?", Date.today).order(:date, :time) }

  include PgSearch::Model
  pg_search_scope :search_by_name_location_date_time,
  against: [ :name, :location, :date, :time ],
  using: {
    tsearch: { prefix: true }
  }
end
