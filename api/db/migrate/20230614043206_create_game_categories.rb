class CreateGameCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_categories do |t|
      t.references :game, null: false
      t.references :category, null: false
    end
  end
end
