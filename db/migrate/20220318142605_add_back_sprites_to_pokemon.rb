class AddBackSpritesToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :back_default, :string
    add_column :pokemons, :back_female, :string
    add_column :pokemons, :back_shiny, :string
    add_column :pokemons, :back_shiny_female, :string
    add_column :pokemons, :home_front_default, :string
    add_column :pokemons, :home_front_female, :string
    add_column :pokemons, :home_front_shiny, :string
    add_column :pokemons, :home_front_shiny_female, :string
  end
end
