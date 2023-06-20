class AddGameListValues < ActiveRecord::Migration[7.0]
  def change
    create_table :game_list_values do |t|
      t.references :game
      t.references :list_value
      t.references :guesser, foreign_key: { to_table: :players }, null: true, default: null
      t.boolean :picked
    end
  end
end
