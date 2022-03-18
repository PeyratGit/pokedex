class AddSpritesFemaleToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :front_female, :string
    add_column :pokemons, :front_shiny_female, :string
  end
end
