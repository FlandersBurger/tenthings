class UpdatePickedListsChangeName < ActiveRecord::Migration[7.0]
  def change
    rename_table :picked_lists, :game_picked_lists
  end
end
