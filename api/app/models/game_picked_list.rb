class PickedListValue < ApplicationRecord
  belongs_to :game
  belongs_to :list
  belongs_to :picker, class_name: 'User'
end
