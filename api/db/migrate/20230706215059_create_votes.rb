class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :voter, foreign_key: { to_table: :users }
      t.references :list
      t.integer :type
      t.timestamps
    end
  end
end
