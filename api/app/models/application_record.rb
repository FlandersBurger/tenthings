class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  def permitted_attributes(_method)
    self.class.column_names - ["id"]
  end
end
