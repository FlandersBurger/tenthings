class CreateGameLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :game_languages do |t|
      t.references :game, null: false
      t.references :language, null: false
    end
  end
end
