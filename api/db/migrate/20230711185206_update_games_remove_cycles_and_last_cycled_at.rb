class UpdateGamesRemoveCyclesAndLastCycledAt < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :cycles
    remove_column :games, :last_cycled_at
  end
end
