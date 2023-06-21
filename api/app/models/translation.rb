class Translation < ApplicationRecord
  belongs_to :language
  belongs_to :source, polymorphic: true
  validates :language, uniqueness: { scope: :source }
  validates :translation, presence: true
end
