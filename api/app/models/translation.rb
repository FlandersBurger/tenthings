class Translation < ApplicationRecord
  belongs_to :language
  belongs_to :source, polymorphic: true
  validates :translation, presence: true
end
