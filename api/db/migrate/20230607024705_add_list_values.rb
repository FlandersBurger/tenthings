class AddListValues < ActiveRecord::Migration[7.0]
  def change
    create_table :list_values do |t|
      t.references :list
      t.references :created_by, foreign_key: { to_table: :users }
      t.string :value
      t.string :blurb
      t.timestamps
    end
  end
end
