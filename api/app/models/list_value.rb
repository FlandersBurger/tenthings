class ListValue < ApplicationRecord
  enum :blurb_type, [:text, :image, :youtube], default: :text

  validates :value, uniqueness: { scope: :list }

  belongs_to :list
  belongs_to :created_by, class_name: "User"
end
