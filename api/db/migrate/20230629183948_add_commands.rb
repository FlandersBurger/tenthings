class AddCommands < ActiveRecord::Migration[7.0]
  def change
    create_table :commands do |t|
      t.string :name
    end
  end
end
