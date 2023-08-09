class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :game, null: false
      t.references :user, null: true, null: false
      t.integer :score, default: 0
      t.integer :daily_score, default: 0
      t.integer :high_score, default: 0
      t.integer :plays, default: 0
      t.integer :wins, default: 0
      t.integer :answers, default: 0
      t.integer :lists, default: 0
      t.integer :hints, default: 0
      t.integer :snubs, default: 0
      t.integer :skips, default: 0
      t.integer :vetoes, default: 0
      t.integer :suggestions, default: 0
      t.integer :searches, default: 0
      t.integer :current_play_streak, default: 0
      t.integer :current_game_streak, default: 0
      t.integer :current_hint_streak, default: 0
      t.integer :max_play_streak, default: 0
      t.integer :max_game_streak, default: 0
      t.integer :max_hint_streak, default: 0
      t.datetime :last_played_at
      t.boolean :present, default: true
      t.integer :minigame_plays, default: 0
      t.integer :tinygame_plays, default: 0
    end
  end
end
