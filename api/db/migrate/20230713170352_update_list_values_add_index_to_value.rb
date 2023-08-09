class UpdateListValuesAddIndexToValue < ActiveRecord::Migration[7.0]
  def change
    add_index :list_values, [:value, :list_id]
  end
end

