class UpdateGamesAddLegacyId < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :legacy_id, :string
  end
end
