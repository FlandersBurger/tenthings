class User < ApplicationRecord
  enum :provider, [:facebook, :google, :telegram]

  validates :legacy_id, uniqueness: { allow_nil: true }
  validates :uid, uniqueness: { allow_nil: true }
  validates :username, uniqueness: { allow_nil: true, allow_blank: false }
  validates :telegram_id, uniqueness: { allow_nil: true }

  has_many :players
  has_many :games, through: :players
end
