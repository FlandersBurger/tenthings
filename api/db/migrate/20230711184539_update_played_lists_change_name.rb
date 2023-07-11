class UpdatePlayedListsChangeName < ActiveRecord::Migration[7.0]
  def change
    rename_table :played_lists, :game_played_lists
  end
end
