class AddSpeciesIdToPokemon < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :species_id
    add_reference :pokemons, :species, null: false, foreign_key: true
  end
end
