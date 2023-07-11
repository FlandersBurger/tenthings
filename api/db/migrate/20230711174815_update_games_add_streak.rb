class UpdateGamesAddStreak < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :streaker, foreign_key: {to_table: :players}, default: nil
    add_column :games, :streak, :integer, default: 0
  end
end
