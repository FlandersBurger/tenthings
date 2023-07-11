class UpdateGamesAddLanguage < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :language
  end
end
