module Paginatable
  extend ActiveSupport::Concern

  included do
    scope :paginate, -> (page, limit = 10) { limit.to_i > 0 ? limit(limit.to_i).offset(page.to_i * limit.to_i) : all }
  end
end
