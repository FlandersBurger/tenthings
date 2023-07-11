class ListCategory < ApplicationRecord
  validates :category, uniqueness: { scope: :list }

  belongs_to :list
  belongs_to :category
end
