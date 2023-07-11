class List < ApplicationRecord
  validates :name, uniqueness: true
  
  belongs_to :language
  belongs_to :created_by, class_name: "User"

  has_many :list_values, as: :values
  has_many :list_categories, as: :categories
end
