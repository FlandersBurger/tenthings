class AddCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    add_reference :categories, :parent_category, null: true
  end
end
