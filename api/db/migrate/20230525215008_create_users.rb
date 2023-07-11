class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :provider
      t.string :legacy_id
      t.string :uid
      t.string :name
      t.string :username
      t.string :telegram_name
      t.string :telegram_username
      t.decimal :telegram_id, precision: 64, scale: 0
      t.string :email
      t.boolean :email_verified
      t.boolean :admin
      t.boolean :banned
      t.string :photo_url
      t.datetime :birth_date

      t.timestamps
    end
  end
end
