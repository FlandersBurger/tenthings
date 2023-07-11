class Game < ApplicationRecord
  enum :platform, [:website, :telegram]
  has_many :players
  has_many :list_values, through: :game_list_values, as: :values
  has_one :list
  has_many :languages, through: :game_languages
  has_many :categories, through: :game_categories
end
