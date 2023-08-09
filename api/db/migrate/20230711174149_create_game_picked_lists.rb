class CreateGamePickedLists < ActiveRecord::Migration[7.0]
  def change
    create_table :game_picked_lists do |t|
      t.references :list, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :picked_lists, :picker, foreign_key: {to_table: :users}, null: false
    end
  end
end
