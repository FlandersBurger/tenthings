class UpdatePickedListsAddPicker < ActiveRecord::Migration[7.0]
  def change
    add_reference :picked_lists, :picker, foreign_key: {to_table: :users}, default: nil
  end
end
