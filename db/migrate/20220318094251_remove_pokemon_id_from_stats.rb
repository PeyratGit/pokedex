class RemovePokemonIdFromStats < ActiveRecord::Migration[6.1]
  def change
    remove_column :stats, :pokemon_id
  end
end
