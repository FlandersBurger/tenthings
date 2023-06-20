class AddGameCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_categories do |t|
      t.references :game
      t.references :category
    end
  end
end
