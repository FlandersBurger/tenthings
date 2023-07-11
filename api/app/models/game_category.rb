class GameCategory < ApplicationRecord
  validates :category, uniqueness: { scope: :game }

  belongs_to :game
  belongs_to :category
end
