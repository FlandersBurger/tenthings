class ListCategory < ApplicationRecord
  belongs_to :list
  belongs_to :category
end