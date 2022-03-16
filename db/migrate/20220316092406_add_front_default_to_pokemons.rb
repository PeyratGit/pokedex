class AddFrontDefaultToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :front_default, :string
  end
end
