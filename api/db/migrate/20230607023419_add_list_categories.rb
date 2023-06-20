class AddListCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :list_categories do |t|
      t.references :list      
      t.references :category
    end
  end
end
