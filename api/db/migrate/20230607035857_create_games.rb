class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :platform
      t.string :platform_id
      t.references :list
      t.boolean :enabled, default: true, null: false
      t.integer :hints, default: 0
      t.integer :cycles, default: 0
      t.datetime :last_cycled_at
      t.datetime :last_played_at
      t.integer :lists_played
      t.boolean :introduces, default: true
      t.boolean :sasses, default: true
      t.boolean :snubs, default: true
      t.boolean :updates, default: true
    end
  end
end
