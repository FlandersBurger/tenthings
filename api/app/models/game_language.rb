class GameLanguage < ApplicationRecord
  belongs_to :game
  belongs_to :language
end