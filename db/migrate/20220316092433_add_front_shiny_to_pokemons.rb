class AddFrontShinyToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :front_shiny, :string
  end
end
