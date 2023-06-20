class AddUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :provider
      t.string :legacy_id
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :telegram_username
      t.string :email

      t.timestamps
    end
  end
end
