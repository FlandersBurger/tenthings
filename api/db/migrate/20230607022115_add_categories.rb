class AddCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :parent_category, null: true
      t.timestamps
    end
  end
end
