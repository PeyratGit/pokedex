class AddOfficialArtworkToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :official_artwork, :string
  end
end
