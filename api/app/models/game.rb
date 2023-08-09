class Game < ApplicationRecord
  after_initialize :set_default_values
  after_update :seed_associations

  validates :platform_id, uniqueness: true

  enum :platform, [:website, :telegram]

  has_many :list_values, through: :game_list_values, as: :values
  has_many :players, through: :game_list_values, as: :guessers
  has_many :game_picked_lists
  has_many :game_played_lists
  has_many :game_languages
  has_many :game_categories
  has_many :lists, through: :game_picked_lists, as: :picked_lists
  has_many :lists, through: :game_played_lists, as: :played_lists
  has_many :languages, through: :game_languages
  has_many :categories, through: :game_categories

  belongs_to :streaker, class_name: "Player", optional: true
  belongs_to :list, optional: true
  belongs_to :language

  private

  def set_default_values
    english = Language.find_by_code('EN')
    assign_attributes(language_id: english.id) if language.nil?
  end

  def seed_associations
    # english = Language.find_by_code('EN')
    # languages << english if languages.empty?
    # categories << Category.all if categories.empty?
  end
end
