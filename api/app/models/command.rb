class Command < ApplicationRecord
  validates :name, uniqueness: true
end
