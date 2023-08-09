class CreateListCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :list_categories do |t|
      t.references :list, null: false    
      t.references :category, null: false
    end
  end
end
