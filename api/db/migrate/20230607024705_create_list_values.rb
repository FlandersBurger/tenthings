class CreateListValues < ActiveRecord::Migration[7.0]
  def change
    create_table :list_values do |t|
      t.references :list, null: false
      t.references :created_by, foreign_key: { to_table: :users }, null: false
      t.string :value, null: false
      t.text :blurb
      t.integer :blurb_type
      t.timestamps
    end
  end
end
