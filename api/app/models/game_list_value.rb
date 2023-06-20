class GameListValue < ApplicationRecord
  belongs_to :game
  belongs_to :list_value
end