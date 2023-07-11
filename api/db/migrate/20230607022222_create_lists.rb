class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :legacy_id
      t.references :created_by, foreign_key: { to_table: :users }
      t.references :language
      t.string :name, null: false
      t.string :search
      t.text :description
      t.integer :frequency, default: 0
      t.integer :difficulty, default: 0
      t.boolean :immutable, default: false, null: false
      t.boolean :enabled, default: true, null: false
      t.integer :plays, default: 0
      t.integer :skips, default: 0
      t.integer :hints, default: 0

      t.timestamps
    end
  end
end
