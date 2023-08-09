class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.references :language, null: false
      t.references :source, polymorphic: true, null: false
      t.string :translation
    end
  end
end
