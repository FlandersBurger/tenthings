class CreateGameListValues < ActiveRecord::Migration[7.0]
  def change
    create_table :game_list_values do |t|
      t.references :game, null: false
      t.references :list_value, null: false
      t.references :guesser, foreign_key: { to_table: :players }, null: true
      t.boolean :picked
    end
  end
end
