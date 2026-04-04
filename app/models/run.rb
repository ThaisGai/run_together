class Run < ApplicationRecord
  belongs_to :user
  has_many :run_members, dependent: :destroy
  has_many :members, through: :run_members, source: :user
  has_one :chat, dependent: :destroy

  # after_create :create_chat

  validates :date,     presence: true
  validates :time,     presence: true
  validates :location, presence: true
  validates :pace,     presence: true
  validates :max_participants, numericality: { greater_than: 0 }, allow_nil: true

  scope :visible_to, ->(user) { user&.female? ? all : where(women_only: false) }
  scope :public_runs, -> { where(private: false) }
  scope :upcoming,    -> { where("date >= ?", Date.today).order(:date, :time) }
  scope :women_only,  -> { where(women_only: true) }
  scope :mixed,       -> { where(women_only: false) }
  scope :small_group, -> { where("max_participants <= ?", 5) }
  scope :big_group,   -> { where("max_participants > ?", 5) }

  include PgSearch::Model
  pg_search_scope :search_by_name_location_date_time,
  against: [ :name, :location, :date, :time ],
  using: {
    tsearch: { prefix: true }
  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def spots_left
    max_participants ? max_participants - members.count : nil
  end

  def full?
    max_participants && members.count >= max_participants
  end
end
