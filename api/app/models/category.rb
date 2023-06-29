class Category < ApplicationRecord
  validates :name, uniqueness: { scope: :parent_category }
  belongs_to :parent_category, class_name: 'Category', optional: true
end
