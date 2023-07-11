class GameListValue < ApplicationRecord
  validates :list_value, uniqueness: { scope: :game }

  belongs_to :game
  belongs_to :list_value
  belongs_to :guesser, class_name: 'Player', optional: true
end
