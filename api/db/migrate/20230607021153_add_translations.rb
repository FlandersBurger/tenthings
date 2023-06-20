class AddTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.references :language
      t.references :source, polymorphic: true
      t.string :translation
    end
  end
end
