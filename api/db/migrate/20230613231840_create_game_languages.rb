class CreateGameLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :game_languages do |t|
      t.references :game
      t.references :language
    end
  end
end
