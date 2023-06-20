class User < ApplicationRecord
  validates :legacy_id, uniqueness: { allow_nil: true }
  has_many :players
  has_many :games, through: :players
end