class Chat < ApplicationRecord
  belongs_to :run

  has_many :messages, dependent: :destroy
end
