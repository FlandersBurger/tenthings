class Language < ApplicationRecord
  validates :code, uniqueness: true, presence: true, length: { is: 2 }
end