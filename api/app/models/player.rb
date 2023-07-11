class Player < ApplicationRecord
  validates :user, uniqueness: { scope: :game }

  belongs_to :game
  belongs_to :user
end
