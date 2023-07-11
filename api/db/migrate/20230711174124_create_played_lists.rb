class CreatePlayedLists < ActiveRecord::Migration[7.0]
  def change
    create_table :played_lists do |t|
      t.references :list, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
    end
  end
end
