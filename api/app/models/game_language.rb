class GameLanguage < ApplicationRecord
  validates :language, uniqueness: { scope: :game }

  belongs_to :game
  belongs_to :language
end