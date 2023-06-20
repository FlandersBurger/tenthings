class List < ApplicationRecord
  has_many :list_values, as: :values
  has_many :list_categories. as: :categories
end