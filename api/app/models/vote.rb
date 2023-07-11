class Vote < ApplicationRecord
  enum type: { upvote: 1, downvote: -1 }
  belongs_to :list
  belongs_to :created_by, class_name: "User"
end
